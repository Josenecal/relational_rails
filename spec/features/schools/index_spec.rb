require 'rails_helper'

RSpec.describe "staff_members#index" do
  before :each do
    before :each do
      @school_1 = School.create!(name: "Johnson Elementary", mailing_address: "12 School Rd, Springfield CO 80000", max_student_capacity: 350, state_rating: "Improvement", is_public: 1, calendar_structure: "semester", grades_served: "k-5", accepting_new_students:1)
      @school_2 = School.create!(name: "John. J Flynn Elementary", mailing_address: "5 Colchester Rd, Springfield CO 80000", max_student_capacity: 250, state_rating: "Performance", is_public: 1, calendar_structure: "semester", grades_served: "k-5", accepting_new_students:0)
      @teaching_staff_1 = school_1.staff_members.create!(name:"Allard, Judy", role:"Teacher", department: "Math", courses: "[]", pay_rate:45000, pay_type:"salary", qualified_instructor:1, active_employee:1)
      @teaching_staff_2 = @school_1.staff_members.create!(name:"Grissum, Bill", role:"Teacher", department: "Phys Ed", courses: "[]", pay_rate:39000, pay_type:"salary", qualified_instructor:1, active_employee:1)
      @admin_staff_1 = @school_1.staff_members.create!(name:"Williams, Brian", role:"Principal", department: "Admin", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:0, active_employee:1)
      @admin_staff_2 = @school_1.staff_members.create!(name:"Williams, Brian", role:"Dean of Students", department: "Admin", courses: "[]", pay_rate:70000, pay_type:"salary", qualified_instructor:1, active_employee: 1)
      @support_staff_1 = @school_1.staff_members.create!(name:"Adams, Douglas", role:"Maintinance Technician", department: "Facilities", courses: "[]", pay_rate:23.50, pay_type:"hourly", qualified_instructor:0, active_employee:1)
      @support_staff_2 = @school_1.staff_members.create!(name:"Dvorak, Miriam", role:"Cook", department: "Kitchen", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:0, active_employee:1)
      @teaching_staff_3 = @school_2.staff_members.create!(name:"Weisenstien, Geoffry", role:"Teacher", department: "Writing", courses: [], pay_rate:35000, pay_type:"salary", qualified_instructor:1, active_employee:1)
      @teaching_staff_4 = @school_2.staff_members.create!(name:"Cliffords, Kelly", role:"Teacher", department: "Reading", courses: [], pay_rate:36000, pay_type:"salary", qualified_instructor:1, active_employee:0)
      @teaching_staff_5 = @school_2.staff_members.create!(name:"Burgouise, Francis", role:"Teacher", department: "Electives", courses: [], pay_rate:35000, pay_type:"salary", qualified_instructor:1, active_employee:1)
      @admin_staff_3 =  @school_2.staff_members.create!(name:"Maxwell, Francine", role:"Counselor", department: "Student Support", courses: [], pay_rate:39000, pay_type:"salary", qualified_instructor:0, active_employee:1)
      @admin_staff_4 =  @school_2.staff_members.create!(name:"Richards, Whitny", role:"Counselor", department: "Student Support", courses: [], pay_rate:42000, pay_type:"salary", qualified_instructor:0, active_employee:1)
  end


  it 'shows the name of each parent in the db' do
    visit '/schools'

    expect(page).to have_content(@school_1.name)
    expect(page).to have_content(@school_2.name)
  end

  it 'shows schools in order that they were created' do
    school_7 = School.create!(name: "Springfield High School", mailing_address: "102 Academic Circle, Springfield CO 80000", max_student_capacity: 600, state_rating: "Improvement", is_public: true, calendar_structure: "semester", grades_served: "9-12", created_at: "2021-12-23")
    visit '/schools'
    # binding.pry
    within('#school-6') do
      expect(page).to have_content(school_7.name)
    end
  end

  it 'has links to schools index and staff members index pages' do
    visit '/schools'

    expect(page).to have_link(href: "/schools/")
    expect(page).to have_link(href: "/staff_members/")
  end

  it 'has a link to a new parent form page' do
    visit '/schools/'
    expect(page).to have_link(href: "/schools/new/")
  end
end
