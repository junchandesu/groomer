class Appointment < ActiveRecord::Base
belongs_to :user
#has_many :dogs, :through => :user
has_many :dogs, through: :appointments_dogs
has_many :appointments_dogs
accepts_nested_attributes_for :appointments_dogs
validates :app_date, presence: true
validates :check_in_time, presence: true
validates :telephone, presence: true
validate :check_and_format_phone_number
validates :dog_id, presence: true

#after_create :send_confirmation_emails

  # Normalizes the attribute itself before validation
#  validates_plausible_phone :telephone, presence: true
def self.unavailable_for?(appointment)
  appts = Appointment.where(app_date: appointment.app_date)
  count = 0

  appts.each do |a|
    count += a.appointments_dogs.count
  end
  puts "*" * 20
  puts count
  return count > 6

end

# before_validation do |model|
#   model.subset_array.reject!(&:blank?) if model.subset_array
# end

 def telephone=(num)
    num.gsub!(/\D/, '') if num.is_a?(String)
    super(num)
 end

 def check_and_format_phone_number
    return if self.telephone.length == 11 && self.telephone.first == "1"
    if self.telephone.length != 10
      self.errors.add(:telephone, "can only be 10 digits")
    end
  end

  private 
  def send_confirmation_emails
   user.dogs.each do |dog|
   	ConfirmationMailer.appointment_confirmation(dog.user, dog, self).deliver_now
   end
  end
end
