class Patient < ApplicationRecord
  has_many :treatments
  validates :email, presence: true, uniqueness: true
end
