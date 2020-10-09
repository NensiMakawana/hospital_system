class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ########################Associations##################################
  has_many :appointments
  has_many :doctors, through: :appointments
  ########################Validations##################################
  validates :name, :gender, presence: true
  validates :number, presence: true, numericality: true, length: { minimum: 10, maximum: 15 }
end
