class PokemonWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  require 'csv'
end
