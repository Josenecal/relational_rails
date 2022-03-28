require 'rails_helper'

RSpec.describe 'staff_members#show' do

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
end
