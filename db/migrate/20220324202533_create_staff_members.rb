class CreateStaffMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_members do |t|
      t.string :role
      t.float :pay_rate
      t.string :pay_type
      t.boolean :qualified_instructor
      t.string :department
      t.string :courses

      t.timestamps
    end
  end
end
