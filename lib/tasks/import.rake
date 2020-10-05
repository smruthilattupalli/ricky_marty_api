require 'json'
require 'rest-client'

# The rake task to upload the bank excel file into the branch table
namespace :import do
  desc 'Import Characters from the API'
  task characters: :environment do
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
  end
end
