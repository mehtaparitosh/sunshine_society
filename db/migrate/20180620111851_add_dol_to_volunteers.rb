class AddDolToVolunteers < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :dol, :date
  end
end
