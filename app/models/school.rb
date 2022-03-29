class School < ApplicationRecord
  has_many:staff_members

  validates_presence_of:name
  validates_presence_of:mailing_address
  validates_presence_of:max_student_capacity
  validates_presence_of:state_rating
  validates_presence_of:calendar_structure
  validates_presence_of:grades_served

  def alphabetical
    staff_members.order(:name)
  end
end
