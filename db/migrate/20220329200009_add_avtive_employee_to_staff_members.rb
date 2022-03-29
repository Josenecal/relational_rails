class AddAvtiveEmployeeToStaffMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :staff_members, :active_employee, :boolean
  end
end
