class AddAgeToStudents < ActiveRecord::Migration[5.2]
  def change

    add_column :students, :age, :integer
    add_column :coordinators, :age, :integer
    add_column :employees, :age, :integer
    add_column :members, :age, :integer
    add_column :mentors, :age, :integer
    add_column :sponsors, :age, :integer
    add_column :volunteers, :age, :integer

  end
end
