class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  #validate :check_and_format_phone_number

   has_many :dogs
   has_many :appointments

  # def check_and_format_phone_number
  #   return if self.phone_number.length == 11 && self.phone_number.first == "1"
  #   if self.phone_number.length != 10
  #     self.errors.add(:phone_number, "can only be 10 digits")
  #   end
  # end
end
