class AddDolToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :dol, :date
  end
end
