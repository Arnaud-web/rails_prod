class AddAdressToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :adress, :string
  end
end
