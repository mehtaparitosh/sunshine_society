class Fixcolumname < ActiveRecord::Migration[5.2]
  def change
    rename_column :members, :type, :kind
  end
end
