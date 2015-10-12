class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :appointments, through: :user
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :weight, presence: true
  validates :breed, presence: true
  validates :name, presence: true
end
