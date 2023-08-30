require 'rails_helper'

RSpec.describe "Faculty_Courses Index", type: :feature do
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

  describe "User Story 5" do
    describe "When I visit /faculty/:id/courses" do
      it "displays each course that is associated with that faculty with each courses attributes" do

        visit "/faculties/#{@faculty_1_id}/courses"

        expect(page).to have_content(@course_1.course_name)
        expect(page).to have_content(@course_1.gen_ed)
        expect(page).to have_content(@course_1.credits)
        expect(page).to have_content(@course_1.start_date)
        expect(page).to have_content(@course_1.end_date)
        expect(page).to have_content(@course_2.course_name)
        expect(page).to have_content(@course_2.gen_ed)
        expect(page).to have_content(@course_2.credits)
        expect(page).to have_content(@course_2.start_date)
        expect(page).to have_content(@course_2.end_date)

        visit "/faculties/#{@faculty_2_id}/courses"

        expect(page).to have_content(@course_3.course_name)
        expect(page).to have_content(@course_3.gen_ed)
        expect(page).to have_content(@course_3.credits)
        expect(page).to have_content(@course_3.start_date)
        expect(page).to have_content(@course_3.end_date)
        expect(page).to have_content(@course_4.course_name)
        expect(page).to have_content(@course_4.gen_ed)
        expect(page).to have_content(@course_4.credits)
        expect(page).to have_content(@course_4.start_date)
        expect(page).to have_content(@course_4.end_date)
     end
    end
  end

  describe "User Story 13" do
    describe "When I visit faculty_courses index page" do
      it " has a link to add a new course for that faculty called 'Add Course'" do

        visit "/faculties/#{@faculty_1.id}/courses"

        expect(page).to have_link("New Course", href: "/faculties/#{@faculty_1.id}/courses/new")
      end
    end
  end

  # Case against the actual sort. Still not alphabetically sorting but link appears and queries
  describe "User Story 16" do
    describe "When i visit the faculty_courses index page" do
      it "has a link to sort the courses in alphabetical order called Alphabetical Sort" do
          
        visit "/faculties/#{@faculty_1.id}/courses"
  
        expect(page).to have_link("Alphabetical Sort", href: "/faculties/#{@faculty_1.id}/courses?sort=true")
        end
      end
    end

  describe "User story 21" do
    describe "When i visit the faculty_courses index page" do
      it "has a form to display credits over a given threshold" do
            
        visit "/faculties/#{@faculty_1.id}/courses"
    
        expect(page).to have_field("credits")
        expect(page).to have_button("Filter")
        end
      end
    end
end