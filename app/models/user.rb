class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
   has_many :dogs
   has_many :appointments

 # check if a user is admin
  def admin?
    role == 'admin'
  end
end
