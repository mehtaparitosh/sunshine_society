class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :mem_id
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
      t.string :designation
      t.date :effective_till
      t.string :type
      t.boolean :voting_right

      t.timestamps
    end
  end
end
