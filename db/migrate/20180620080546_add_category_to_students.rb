class AddCategoryToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :category, :string
  end
end
