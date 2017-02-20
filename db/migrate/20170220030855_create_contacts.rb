class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone_1
      t.string :phone_2
      t.text :address
      t.string :web

      t.timestamps null: false
    end
  end
end
