class AddStartAndEndToStudentSponsors < ActiveRecord::Migration[5.2]
  def change
    add_column :student_coordinators, :start, :date
    add_column :student_coordinators, :end, :date

    add_column :student_mentors, :start, :date
    add_column :student_mentors, :end, :date

    add_column :student_programs, :start, :date
    add_column :student_programs, :end, :date

    add_column :student_schools, :start, :date
    add_column :student_schools, :end, :date

    add_column :student_sponsors, :start, :date
    add_column :student_sponsors, :end, :date

    add_column :student_supports, :start, :date
    add_column :student_supports, :end, :date

    add_column :student_volunteers, :start, :date
    add_column :student_volunteers, :end, :date

    add_column :sponsor_programs, :start, :date
    add_column :sponsor_programs, :end, :date

    add_column :volunteer_schools, :start, :date
    add_column :volunteer_schools, :end, :date

    add_column :member_designations, :start, :date
    add_column :member_designations, :end, :date

    add_column :employee_designations, :start, :date
    add_column :employee_designations, :end, :date

    add_column :employee_workplaces, :start, :date
    add_column :employee_workplaces, :end, :date
  end
end
