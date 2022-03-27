class AddNewStudentsToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :accepting_new_students, :boolean
  end
end
