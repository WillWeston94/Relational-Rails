require "rails_helper"

RSpec.describe "Faculty show", type: :feature do
  describe "As a visitor" do
    describe "When I visit /faculties/:id" do
      it "displays faculty including attributes " do
        faculty_1 = Faculty.create(department: "Computer Science Information")

        visit "/faculties/#{faculty_1.id}"

        expect(page).to have_content(faculty_1.department)
      end
    end
  end
end