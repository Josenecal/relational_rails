require 'rails_helper'

RSpec.describe 'schools#edit' do

  before :each do
    @school_1 = School.create!(name: "Johnson Elementary", mailing_address: "12 School Rd, Springfield CO 80000", max_student_capacity: 350, state_rating: "Improvement", is_public: true, calendar_structure: "semester", grades_served: "k-5")
  end

  it "links from 'update school' on school show page to form to update attributes" do
    visit "/schools/#{@school_1.id}/"

    click_link "Update School"

    expect(current_path).to eq("/schools/#{@school_1.id}/edit/")

    fill_in :name, with: "Johnson and Johnson Elementary"
    check :is_public
    check :accepting_new_students

    click_on "Update School"

    expect(current_path).to eq("/schools/#{@school_1.id}/")
    expect(page).to have_content("Johnson and Johnson Elementary")
  end
end
