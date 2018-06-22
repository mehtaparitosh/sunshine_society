class CreateSponsorPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsor_programs do |t|
      t.boolean :active
      t.references :sponsor, foreign_key: true
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
