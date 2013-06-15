class AddPasswordToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :password, :string
  end
end
