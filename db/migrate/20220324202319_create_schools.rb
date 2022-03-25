class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :mailing_address
      t.integer :max_student_capacity
      t.string :state_rating
      t.boolean :is_public
      t.string :calendar_structure
      t.string :grades_served
      
      t.timestamps
    end
  end
end
