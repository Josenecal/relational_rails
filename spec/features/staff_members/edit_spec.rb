require 'rails_helper'

RSpec.describe 'school staff members # edit' do
  before :each do
    before :each do
      @school_1 = School.create!(name: "Johnson Elementary", mailing_address: "12 School Rd, Springfield CO 80000", max_student_capacity: 350, state_rating: "Improvement", is_public: 1, calendar_structure: "semester", grades_served: "k-5", accepting_new_students:1)
      @teaching_staff_1 = school_1.staff_members.create!(name:"Allard, Judy", role:"Teacher", department: "Math", courses: "[]", pay_rate:45000, pay_type:"salary", qualified_instructor:1, active_employee:1)
  end

  describe 'child update feature'do
    describe 'click link Update Staff Member from staff member show page, loads an update form with staff member attributes' do
      it 'click Submit sends Path request to staff_members/:id, updates and redirects to staff_member/:id' do
        visit "/staff_members/#{@teaching_staff_1.id}/"
        click_link "Update Staff Member"

        expect(current_path).to eq("/staff_members/#{@teaching_staff_1.id}/edit/")

        fill_in :name, with: "Thompson, Guy"
        fill_in :department, with: "German Language"
        check :qualified_instructor
        click_on "Update Staff Member"

        expect(current_path).to eq("/staff_members/#{@teaching_staff_1.id}/")
        expect(page).to have_content("Thompson, Guy") # Updated
        expect(page).to have_content("German Language") # Updated
        expect(page).to have_content("45000") # Not updated
      end
    end
  end

end
