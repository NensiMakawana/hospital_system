class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ########################Associations##################################
  has_many :availibility_time_slots
  has_many :appointments
  has_many :patients, through: :appointments
  ########################Validations##################################
  validates :name, :gender, presence: true
  validates :number, presence: true, numericality: true, length: { minimum: 10, maximum: 15 }
end
