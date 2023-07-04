class CreateBleauProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :bleau_problems do |t|
      t.string :name
      t.string :grade
      t.boolean :sit_start
      t.references :bleau_circuit, index: true
      t.string :bleau_circuit_number
      t.string :bleau_circuit_letter
      t.integer :ascents
      t.integer :ratings
      t.decimal :ratings_average
      t.references :bleau_area, index: true
      t.timestamps
    end
  end
end
