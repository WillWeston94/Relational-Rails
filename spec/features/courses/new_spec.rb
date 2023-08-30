require 'rails_helper'

RSpec.describe "Course New", type: :feature do
  before(:each) do
    @faculty_1 = Faculty.create!(name: "Mr. Mr Mike Rice", department: "Mathematics", email: "MRice@edu.com", phone: "(216)440-6000", office_hours: true, years_instructing: 19 )
    @faculty_1_id = @faculty_1.id
    @course_1 = Course.create!(faculty_id: @faculty_1_id, course_name: "Calculus II", gen_ed: true, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_2 = Course.create!(faculty_id: @faculty_1_id, course_name: "Modern Algebra", gen_ed: true, credits: 3, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_3 = Course.create!(faculty_id: @faculty_1_id, course_name: "Vector Analysis", gen_ed: false, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
  end

  describe "User Story 3" do
    describe "When I visit /courses" do
      it "displays each course in the system" do
        visit '/courses'

        expect(page).to have_content(@course_1.course_name)
        expect(page).to have_content(@course_2.course_name)
      end
    end
  end

  describe "User Story 15" do
    describe "When i visit the Courses index page" do
      it "I only see records where the boolean column 'gen_ed' is set to true" do
          
          visit '/courses'
  
          expect(page).to have_content(@course_1.course_name)
          expect(page).to have_content(@course_2.course_name)

          expect(page).to_not have_content(@course_3.course_name)
        end
      end
    end
end