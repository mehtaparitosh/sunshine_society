class AddDolToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :dol, :date
  end
end
