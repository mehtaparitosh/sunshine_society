class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :full_form
      t.text :comments

      t.timestamps
    end
  end
end
