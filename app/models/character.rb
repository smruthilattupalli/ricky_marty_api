class Character < ApplicationRecord
  has_many :episodes
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.cache_key(characters)
    {
      serializer: 'characters',
      stat_record: characters.maximum(:updated_at)
    }
  end
end
