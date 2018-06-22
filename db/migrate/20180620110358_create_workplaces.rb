class CreateWorkplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workplaces do |t|
      t.string :name
      t.text :address
      t.string :contact
      t.text :comments

      t.timestamps
    end
  end
end
