class CharactersController < ApplicationController
  def index
    render json: Character.includes(:episodes).to_json(include: :episodes)
  end
end
