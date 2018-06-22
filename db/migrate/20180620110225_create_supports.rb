class CreateSupports < ActiveRecord::Migration[5.2]
  def change
    create_table :supports do |t|
      t.string :name
      t.text :address
      t.string :contact
      t.text :comments

      t.timestamps
    end
  end
end
