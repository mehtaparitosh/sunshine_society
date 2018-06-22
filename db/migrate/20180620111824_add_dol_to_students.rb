class AddDolToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :dol, :date
  end
end
