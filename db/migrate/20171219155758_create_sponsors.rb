class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :sp_id
      t.string :name
      t.string :gender
      t.date :dob
      t.date :doj
      t.string :contact
      t.string :email
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.boolean :active
      t.integer :program_id
      t.string :sponsor_type

      t.timestamps
    end
  end
end
