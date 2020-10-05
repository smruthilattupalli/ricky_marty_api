class Character < ApplicationRecord
  has_many :episodes
  validates :name, presence: true
  validates :name, uniqueness: true
end
