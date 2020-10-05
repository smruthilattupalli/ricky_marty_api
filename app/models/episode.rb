class Episode < ApplicationRecord
  belongs_to :character, touch: true
  validates :number, presence: true
  validates :number, uniqueness: true
end
