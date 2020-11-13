class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :specialty
      t.string :prix
      t.string :photo

      t.timestamps
    end
  end
end
