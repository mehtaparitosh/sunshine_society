class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :em_id
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
      t.integer :location_id
      t.string :education
      t.string :compensation
      t.string :cheque_name

      t.timestamps
    end
  end
end
