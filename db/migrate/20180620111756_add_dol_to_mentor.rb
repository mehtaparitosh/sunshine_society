class AddDolToMentor < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :dol, :date
  end
end
