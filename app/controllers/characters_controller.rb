class CharactersController < ApplicationController
  def index
    # render json: Character.includes(:episodes).to_json(include: :episodes)
    @characters = Character.all
    Rails.cache.fetch(Character.cache_key(@characters)) do
      @characters
    end
  end
end
