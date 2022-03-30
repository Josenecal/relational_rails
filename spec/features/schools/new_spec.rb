require 'rails_helper'

RSpec.describe "schools#new" do
  describe "shows a form to collect parent attribute data, which" do
    describe "sends a Post request to '/schools/' " do
      it do
        visit '/schools/'

        click_button :new_school

        expect(current_path).to eq('/schools/new/')

        fill_in :name, with: "Test School"
        fill_in :mailing_address, with: "123 Academia Dr"
        fill_in :capacity, with: "375"
        fill_in :rating, with: "Performance"
        check :is_public
        check :accepting_new_students
        fill_in :calendar_structure, with: "Trimesters"
        fill_in :grades_served, with: "k-12"

        click_on "Create School"

        expect(current_path).to eq("/schools/")
        expect(page).to have_content("Test School")
      end

    end
  end
end
