require 'rails_helper'

RSpec.describe "Faculty Index", type: :feature do
  describe "As a visitor" do
    describe "When I visit /faculty" do
      it "displays each faculty record in the system" do
        faculty_1 = Faculty.create(name: "Mr. Fernando Cantillo")
        faculty_2 = Faculty.create(name: "Mr. Mike Rice")

        visit '/faculties'

        expect(page).to have_content(faculty_1.name)
        expect(page).to have_content(faculty_2.name)
      end
    end
  end
end