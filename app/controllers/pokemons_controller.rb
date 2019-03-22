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

    CSV.foreach((csv_path), headers: true) do |pokemon|
      pokemon = Pokemon.create(number: pokemon['species_id'], 
                            name: pokemon['identifier'], 
                            height: pokemon['height'], 
                            weight: pokemon['weight'], 
                            base_exp: pokemon['base_experience'])

    end
    flash[:notice] = "All Pokemon added to db."
    redirect_to root_path
  end

  def destroy
    Pokemon.destroy_all
    flash[:notice] = "All Pokemon deleted from db."
    redirect_to root_path
  end

  private

  def set_pokemon
    @pokemons = Pokemon.all
  end

end
