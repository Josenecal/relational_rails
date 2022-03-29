require 'rails_helper'

RSpec.describe "schools#new" do
  describe "shows a form to collect parent attribute data, which" do
    describe "sends a Post request to '/schools/' " do
      it do
        visit '/schools/'

        click_link 'New School'

        expect(current_path).to eq('/schools/new/')

        fill_in "Name" with: "Test School"
        fill_in "Mailing Address" with: "123 Academia Dr"
        fill_in "Max Student Capacity" with: "375"
        fill_in "State Rating" with: "Performance"
        fill_in "Is Public" with: "true"
        fill_in "Calendar Structure" with: "Trimesters"
        fill_in "Grades Served" with: "k-12"
        fill_in "Accepting New Enrollments" with: "true"

        click_on "Create School"

        expect(current_path).to eq("/schools/")
        expect(page).to have_content("Test School")
      end

    end
  end
end
