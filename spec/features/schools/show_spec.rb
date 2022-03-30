require 'rails_helper'

RSpec.describe 'staff_members#show' do

  before :each do
    @school_1 = School.create!(name: "Johnson Elementary", mailing_address: "12 School Rd, Springfield CO 80000", max_student_capacity: 350, state_rating: "Improvement", is_public: 1, calendar_structure: "semester", grades_served: "k-5", accepting_new_students:1)
    @school_2 = School.create!(name: "John. J Flynn Elementary", mailing_address: "5 Colchester Rd, Springfield CO 80000", max_student_capacity: 250, state_rating: "Performance", is_public: 1, calendar_structure: "semester", grades_served: "k-5", accepting_new_students:0)
    @teaching_staff_1 = @school_1.staff_members.create!(name:"Allard, Judy", role:"Teacher", department: "Math", courses: "[]", pay_rate:45000, pay_type:"salary", qualified_instructor:1, active_employee:1)
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

  it 'shows data from each table atribute from a specific school id number' do
    visit "/schools/#{@school_2.id}"

    expect(page).to have_content(@school_2.name)
    expect(page).to have_content(@school_2.mailing_address)
    expect(page).to have_content(@school_2.max_student_capacity)
    expect(page).to have_content(@school_2.state_rating)
    expect(page).to have_content(@school_2.is_public)
    expect(page).to have_content(@school_2.calendar_structure)

    expect(page).not_to have_content(@school_1.name)
  end

  it 'shows a count of all staff members belonging to this school' do
  visit "/schools/#{@school_1.id}"

    expect(page).to have_content("Total Staff: 6")
  end

  it 'has links to schools index and staff members index pages' do
    visit "/staff_members/#{@admin_staff_2.id}/"

    expect(page).to have_link(href: "/schools/")
    expect(page).to have_link(href: "/staff_members/")
  end

  it "has a link to this school's staff members" do
    visit "/schools/#{@school_1.id}"
    # binding.pry 
    expect(page).to have_link(href: "/schools/#{@school_1.id}/staff_members/")
  end

  it "has a delete link" do
    school_5 = School.create!(name: "Springfield High School", mailing_address: "102 Academic Circle, Springfield CO 80000", max_student_capacity: 600, state_rating: "Improvement", is_public: 1, calendar_structure: "semester", grades_served: "9-12", accepting_new_students:1)
    School_6 = School.create!(name: "Launch Charter Academy", mailing_address: "102 Academic Circle, Springfield CO 80000", max_student_capacity: 350, state_rating: "Performance", is_public: 0, calendar_structure: "quarter", grades_served: "k-12", accepting_new_students:1)

    visit "/schools/#{school_6.id}/"

    click_on("Delete School")

    expect(current_path).to eq("/schools/")

    expect(page).not_to have_content("#{school_6.name}")
  end
end
