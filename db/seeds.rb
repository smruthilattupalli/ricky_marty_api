require 'json'
require 'rest-client'

# Seed the initial data for Character and Episode models
# Used Rest client and Active IMport to import bulk data
puts 'Fetching the characters from RickAndMortyApi...'

characters = []
fetch_url = 'https://rickandmortyapi.com/api/character'
loop do
  response = RestClient.get fetch_url
  result_set = JSON.parse(response)
  info = result_set['info']
  character_set = result_set['results']
  character_set.each do |character|
    episode_set = character['episode']
    new_character = Character.new(name: character['name'],
                                  status: character['status'],
                                  image: character['image'])
    episode_set.each do |episode_url|
      new_character.episodes.build(number: episode_url)
    end
    characters << new_character
  end
  fetch_url = info['next']
  break if fetch_url.nil?
end
Character.import! characters, recursive: true

puts "#{Character.count} characters and #{Episode.count} episodes seeded successfully"
