class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :appointments, through: :appointments_dogs
  has_many :appointments_dogs
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :weight, presence: true
  validates :breed, presence: true
  validates :name, presence: true
end
