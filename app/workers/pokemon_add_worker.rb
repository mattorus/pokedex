class PokemonAddWorker < PokemonWorker
  
  def perform(csv_path)
    CSV.foreach((csv_path), headers: true) do |pokemon|
      pokemon = Pokemon.create(number: pokemon['species_id'], 
                            name: pokemon['identifier'], 
                            height: pokemon['height'], 
                            weight: pokemon['weight'], 
                            base_exp: pokemon['base_experience'])
      end
  end

end
