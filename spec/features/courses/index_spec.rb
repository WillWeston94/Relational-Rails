require 'rails_helper'

RSpec.describe "Course Index", type: :feature do
  describe "As a visitor" do
    describe "When I visit /courses" do
      it "displays each course record in the system" do
        course_1 = Course.create(course_name: "Vector Analysis")
        course_2 = Course.create(course_name: "Calculus II")

          visit '/courses'

          expect(page).to have_content(course_1.course_name)
          expect(page).to have_content(course_2.course_name)
      end
    end
  end
end