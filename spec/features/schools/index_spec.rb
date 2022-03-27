require 'rails_helper'

RSpec.describe "School Controlled Features" do
  before :each do
    @school_1 = School.create!(name: "Johnson Elementary", mailing_address: "12 School Rd, Springfield CO 80000", max_student_capacity: 350, state_rating: "Improvement", is_public: true, calendar_structure: "semester", grades_served: "k-5")
    @school_2 = School.create!(name: "John J Flynn Elementary", mailing_address: "5 Colchester Rd, Springfield CO 80000", max_student_capacity: 250, state_rating: "Performance", is_public: true, calendar_structure: "semester", grades_served: "k-5")

  end

  context "path /schools"
    it 'shows the name of each parent in the db' do
      visit '/schools'

      expect(page).to have_content(@school_1.name)
      expect(page).to have_content(@school_2.name)
    end
  end

  context "path /schools/:id" do
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
  end

end
