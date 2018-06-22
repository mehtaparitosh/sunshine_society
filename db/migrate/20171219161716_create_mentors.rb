class CreateMentors < ActiveRecord::Migration[5.0]
  def change
    create_table :mentors do |t|
      t.string :men_id
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

      t.timestamps
    end
  end
end
