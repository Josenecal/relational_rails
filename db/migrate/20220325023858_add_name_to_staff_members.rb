class AddNameToStaffMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :staff_members, :name, :string
  end
end
