class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  #validate :check_and_format_phone_number

   has_many :dogs
   has_many :appointments

  def admin?
    role == 'admin'
  end
end
