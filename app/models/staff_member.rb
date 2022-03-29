class StaffMember < ApplicationRecord
  belongs_to:school

  validates_presence_of:name
  validates_presence_of:role
  validates_presence_of:pay_rate
  validates_presence_of:pay_type
  validates_presence_of:department
  validates_presence_of:courses

  def self.active
    all.where("active_employee IS true")
  end
end
