class AddDolToCoordinator < ActiveRecord::Migration[5.2]
  def change
    add_column :coordinators, :dol, :date
  end
end
