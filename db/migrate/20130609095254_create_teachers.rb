class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :vorname
      t.string :nachname
      t.string :adresse
      t.string :fach
      t.string :schultyp
      t.string :preis

      t.timestamps
    end
  end
end
