require "rails_helper"

RSpec.describe "Courses show", type: :feature do
  describe "As a visitor" do
    describe "When I visit /courses/:id" do
      it "displays courses including attributes " do
        course_1 = Course.create(course_name: "Data Structures")

        visit "/courses/#{course_1.id}"

        expect(page).to have_content(course_1.course_name)
      end
    end
  end
end