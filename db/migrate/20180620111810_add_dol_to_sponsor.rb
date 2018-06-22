class AddDolToSponsor < ActiveRecord::Migration[5.2]
  def change
    add_column :sponsors, :dol, :date
  end
end
