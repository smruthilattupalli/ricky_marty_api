class CharactersController < ApplicationController
  def index
    # render json: Character.includes(:episodes).to_json(include: :episodes)
    # set the offset and limit to display 10 records per page
    @characters = Character.paginate(page: params[:page], per_page: 10)
    Rails.cache.fetch(Character.cache_key(@characters)) do
      @characters
    end
  end
end
