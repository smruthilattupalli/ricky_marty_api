class Episode < ApplicationRecord
  belongs_to :character
  validates :number, presence: true
  validates :number, uniqueness: true
end
