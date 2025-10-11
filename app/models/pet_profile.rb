class PetProfile < ApplicationRecord
  has_many :supplies, dependent: :destroy
  has_many :tasks, dependent: :destroy
  validates :name, :animal, :dob, :gender, presence: true
end
