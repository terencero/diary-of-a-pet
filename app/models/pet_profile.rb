class PetProfile < ApplicationRecord
  has_many :supplies, dependent: :destroy
  validates :name, :animal, :dob, :gender, presence: true
end
