class AddDaysAvailableToVolunteers < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :days_available, :string
  end
end
