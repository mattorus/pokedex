class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.integer :number
      t.string :name
      t.integer :height
      t.integer :weight
      t.integer :base_exp

      t.timestamps
    end
  end
end
