class CreateUserComments < ActiveRecord::Migration[6.0]
  def change
    create_table :user_comments do |t|
      t.belongs_to :hotel
      t.belongs_to :user
      t.string :message

      t.timestamps
    end
  end
end
