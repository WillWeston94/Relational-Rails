require 'rails_helper'

RSpec.describe "Faculty Edit", type: :feature do
  before(:each) do
    @faculty_1 = Faculty.create!(name: "Mr. Fernando Cantillo", department: "Computer Science Information", email: "FCantillo@edu.com", phone: "(918)548-4000", office_hours: true, years_instructing: 18)
    @faculty_2 = Faculty.create!(name: "Mr. Mike Rice", department: "Mathematics", email: "MRice@edu.com", phone: "(216)440-6000", office_hours: true, years_instructing: 19)
    @faculty_1_id = @faculty_1.id
    @faculty_2_id = @faculty_2.id
    @course_1 = Course.create!(faculty_id: @faculty_1_id, professor: "Mr. Fernando Cantillo", course_name: "Data Structures", gen_ed: false, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_2 = Course.create!(faculty_id: @faculty_1_id, professor: "Mr. Fernando Cantillo", course_name: "Big Data", gen_ed: false, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_3 = Course.create!(faculty_id: @faculty_2_id, professor: "Mr. Mike Rice", course_name: "Calculus II", gen_ed: true, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_4 = Course.create!(faculty_id: @faculty_2_id, professor: "Mr. Mike Rice", course_name: "Vector Analysis", gen_ed: false, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_5 = Course.create!(faculty_id: @faculty_2_id, professor: "Mr. Mike Rice", course_name: "Applied Mathematics", gen_ed: false, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_6 = Course.create!(faculty_id: @faculty_2_id, professor: "Mr. Mike Rice", course_name: "Modern Algebra", gen_ed: true, credits: 3, start_date: "8-1-2023", end_date: "12-15-2023")
  end
      
  describe "User Story 8" do
    describe "When i visit any page on the site" do
      it "has a link at the top that takes me to the course index" do

        visit '/faculties/new'

        expect(page).to have_link("Our Courses", href: "/courses")
      end
    end
  end

  describe "User Story 9" do
    describe "When i visit any page on the site" do
      it "has a link at the top that takes me to the faculty index" do

        visit '/faculties/new'

        expect(page).to have_link("Our Faculty", href: "/faculties")
      end
    end
  end
end