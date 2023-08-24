require "rails_helper"

RSpec.describe "Faculty show", type: :feature do
  describe "As a visitor" do
    describe "When I visit /faculty/:id" do
      it "displays faculty id including attributes " do
        faculty_1 = Faculty.create(department: "testing")

          visit "/faculties/:id"

          expect(page).to have_content(faculty_1.department)
      end
    end
  end
end