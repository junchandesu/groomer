class Appointment < ActiveRecord::Base
belongs_to :user
#has_many :dogs, :through => :user
has_many :dogs, through: :appointments_dogs
has_many :appointments_dogs
accepts_nested_attributes_for :appointments_dogs
validates :app_date, presence: true
validates :check_in_time, presence: true
validates :telephone, presence: true
#
scope :visible_to, -> (user) { user.role == 'admin' ? all : where(user_id: user.id )}

# --removed validation because dog_id returns nil

after_create :send_confirmation_emails



# Normalizes the attribute itself before validation
#  validates_plausible_phone :telephone, presence: true
def self.unavailable_for?(appointment, dog_count)
  appts = Appointment.where(app_date: appointment.app_date)
  count = 0

  appts.each do |a|
    count += a.appointments_dogs.count
  end
  puts "*" * 20
 count += dog_count
  return count > 7

end

# retrieve the booked date
def self.booked_record
   booked_date = Array.new
   Appointment.all.each do  |d| 
     booked_date << d.app_date
  end
  booked_date.uniq.sort
end

# include phone info under new view
 def telephone=(num)
    num.gsub!(/\D/, '') if num.is_a?(String)
    super(num)
 end


# check the length of digits to 10 only
 def check_and_format_phone_number
    return if self.telephone.length == 11 && self.telephone.first == "1"
    if self.telephone.length != 10
      self.errors.add(:telephone, "can only be 10 digits")
    end
  end

private 
# once the appointment object is created sucessfully, the mail reminder is sent through Mailer
  def send_confirmation_emails
   user.dogs.each do |dog|
   	ConfirmationMailer.appointment_confirmation(dog.user, dog, self).deliver_now
   end
  end
end
