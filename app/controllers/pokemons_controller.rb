class PokemonsController < ApplicationController
  before_action :set_pokemon

  require 'csv'

  def index
    @pokemons = Pokemon.all
  end

  def list
    if(params[:pokemon] && params[:pokemon][:limit])
      @pokemon_limit = params[:pokemon][:limit].to_i
    end
  end

  def upload
    csv_path = File.join(Rails.root, 'db', 'pokemon.csv')
    PokemonAddWorker.perform_async(csv_path)
    
    flash[:notice] = "Adding Pokemon to the db.."
    redirect_to root_path
  end

  def destroy
    PokemonRemoveWorker.perform_async
    flash[:notice] = "Removing Pokemon from the db..."
    redirect_to root_path
  end

  private

  def set_pokemon
    @pokemons = Pokemon.all
  end

end
