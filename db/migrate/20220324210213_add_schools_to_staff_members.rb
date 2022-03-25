class AddSchoolsToStaffMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :staff_members, :school, foreign_key: true
  end
end
