require 'rails_helper'

RSpec.describe "staff_members#index" do
  before :each do
    @school_1 = School.create!(name: "Johnson Elementary", mailing_address: "12 School Rd, Springfield CO 80000", max_student_capacity: 350, state_rating: "Improvement", is_public: true, calendar_structure: "semester", grades_served: "k-5")
    @school_2 = School.create!(name: "John. J Flynn Elementary", mailing_address: "5 Colchester Rd, Springfield CO 80000", max_student_capacity: 250, state_rating: "Performance", is_public: true, calendar_structure: "semester", grades_served: "k-5")
    @school_3 = School.create!(name: "Edmund Middle Academy", mailing_address: "1325 Main St, Springfield CO 80000", max_student_capacity: 400, state_rating: "Improvement Needed", is_public: true, calendar_structure: "trimester", grades_served: "6-8")
    @school_4 = School.create!(name: "Hunt Middle School", mailing_address: "1 Academic Circle, Springfield CO 80000", max_student_capacity: 450, state_rating: "Performance", is_public: true, calendar_structure: "semester", grades_served: "6-8")
    @school_5 = School.create!(name: "Springfield High School", mailing_address: "102 Academic Circle, Springfield CO 80000", max_student_capacity: 600, state_rating: "Improvement", is_public: true, calendar_structure: "semester", grades_served: "9-12")
    @School_6 = School.create!(name: "Launch Charter Academy", mailing_address: "102 Academic Circle, Springfield CO 80000", max_student_capacity: 350, state_rating: "Performance", is_public: true, calendar_structure: "quarter", grades_served: "k-12")

    @teaching_staff_1 = @school_1.staff_members.create!(name:"Allard, Judy", role:"Teacher", department: "Math", courses: "[]", pay_rate:45000, pay_type:"salary", qualified_instructor:true)
    @teaching_staff_2 = @school_1.staff_members.create!(name:"Grissum, Bill", role:"Teacher", department: "Phys Ed", courses: "[]", pay_rate:39000, pay_type:"salary", qualified_instructor:true)
    @admin_staff_1 = @school_1.staff_members.create!(name:"Williams, Brian", role:"Principal", department: "Admin", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:true)
    @admin_staff_2 = @school_1.staff_members.create!(name:"Williams, Brian", role:"Dean of Students", department: "Admin", courses: "[]", pay_rate:70000, pay_type:"salary", qualified_instructor:true)
    @support_staff_1 = @school_1.staff_members.create!(name:"Adams, Douglas", role:"Maintinance Technician", department: "Facilities", courses: "[]", pay_rate:23.50, pay_type:"hourly", qualified_instructor:true)
    @support_staff_2 = @school_1.staff_members.create!(name:"Dvorak, Miriam", role:"Cook", department: "Kitchen", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:true)
  end


  it 'shows the name of each parent in the db' do
    visit '/schools'

    expect(page).to have_content(@school_1.name)
    expect(page).to have_content(@school_2.name)
  end

  xit 'shows schools in order that they were created' do
    # Oh God no how do you even test for this!?!
    # Stack Overflow suggests regex can solve this but we'll be testing
    # with literals that won't update with variables. hmmm.....
    # Workshop this!
  end
end
