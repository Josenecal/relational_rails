require 'rails_helper'

RSpec.describe "school_staff_members#new" do

  before :each do
    @school_1 = School.create!(name: "Johnson Elementary", mailing_address: "12 School Rd, Springfield CO 80000", max_student_capacity: 350, state_rating: "Improvement", is_public: 1, calendar_structure: "semester", grades_served: "k-5", accepting_new_students:1)
    @teaching_staff_1 = @school_1.staff_members.create!(name:"Allard, Judy", role:"Teacher", department: "Math", courses: "[]", pay_rate:45000, pay_type:"salary", qualified_instructor:1, active_employee:1)
    @teaching_staff_2 = @school_1.staff_members.create!(name:"Grissum, Bill", role:"Teacher", department: "Phys Ed", courses: "[]", pay_rate:39000, pay_type:"salary", qualified_instructor:1, active_employee:1)
    @admin_staff_1 = @school_1.staff_members.create!(name:"Williams, Brian", role:"Principal", department: "Admin", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:0, active_employee:1)
    @admin_staff_2 = @school_1.staff_members.create!(name:"Williams, Brian", role:"Dean of Students", department: "Admin", courses: "[]", pay_rate:70000, pay_type:"salary", qualified_instructor:1, active_employee: 1)
    @support_staff_1 = @school_1.staff_members.create!(name:"Adams, Douglas", role:"Maintinance Technician", department: "Facilities", courses: "[]", pay_rate:23.50, pay_type:"hourly", qualified_instructor:0, active_employee:1)
    @support_staff_2 = @school_1.staff_members.create!(name:"Dvorak, Miriam", role:"Cook", department: "Kitchen", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:0, active_employee:1)
  end

  describe "shows a form to collect school staff member's attribute data, which" do
    describe "sends a Post request to '/schools/:id/staff_members/new/' " do
      it do
        visit "/schools/#{@school_1.id}/staff_members/"

        click_link 'Create Staff Member'

        expect(current_path).to eq("/schools/#{@school_1.id}/staff_members/new/")

        fill_in :name, with: "Willy, Groundskeeper"
        fill_in :role, with: "Groundskeeper"
        fill_in :department, with: "Facility Maintinance"
        fill_in :pay_rate, with: "23.50"
        fill_in :pay_type, with: "salary"
        check :active_employee

        click_on "Create Staff Member"

        expect(current_path).to eq("/schools/#{@school_1.id}/staff_members/")
        expect(page).to have_content("Willy, Groundskeeper")
      end

    end
  end
end
