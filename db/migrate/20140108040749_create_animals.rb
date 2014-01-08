class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :weight
      t.text :notes

      t.timestamps
    end
  end
end
