require "rails_helper"

RSpec.describe "Faculty show", type: :feature do
  before(:each) do
    @faculty_1 = Faculty.create!(name: "Mr. Fernando Cantillo", department: "Computer Science Information", email: "FCantillo@edu.com", phone: "(918)548-4000", office_hours: true, years_instructing: 18)
    @faculty_2 = Faculty.create!(name: "Mr. Mike Rice", department: "Mathematics", email: "MRice@edu.com", phone: "(216)440-6000", office_hours: true, years_instructing: 19)
    @faculty_1_id = @faculty_1.id
    @faculty_2_id = @faculty_2.id
    @course_1 = Course.create!(faculty_id: @faculty_1_id, course_name: "Data Structures", gen_ed: false, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_2 = Course.create!(faculty_id: @faculty_1_id, course_name: "Big Data", gen_ed: false, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_3 = Course.create!(faculty_id: @faculty_2_id, course_name: "Calculus II", gen_ed: true, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_4 = Course.create!(faculty_id: @faculty_2_id, course_name: "Vector Analysis", gen_ed: false, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_5 = Course.create!(faculty_id: @faculty_2_id, course_name: "Applied Mathematics", gen_ed: false, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_6 = Course.create!(faculty_id: @faculty_2_id, course_name: "Modern Algebra", gen_ed: true, credits: 3, start_date: "8-1-2023", end_date: "12-15-2023")
  end

  describe "User Story 2" do
    describe "When I visit /faculty/:id" do
      it "displays faculty including attributes" do

        visit "/faculties/#{@faculty_1_id}"

        expect(page).to have_content(@faculty_1.name)
        expect(page).to have_content(@faculty_1.department)
        expect(page).to have_content(@faculty_1.email)
        expect(page).to have_content(@faculty_1.phone)
        expect(page).to have_content(@faculty_1.office_hours)
        expect(page).to have_content(@faculty_1.years_instructing)
      end
    end
  end

  describe "User Story 7" do
    describe "When I visit /faculties/:id" do
      it "displays the number of courses taught by that faculty" do

        visit "/faculties/#{@faculty_1_id}"

        expect(page).to have_content("Courses Taught: 2")

        visit "/faculties/#{@faculty_2_id}"

        expect(page).to have_content("Courses Taught: 4")
      end
    end
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

  describe "User Story 10" do
    describe "When i visit faculty show page ('/faculties/:id') " do
      it "has a link to take me to that faculties `courses` page " do
          
          visit "/faculties/#{@faculty_1.id}"
  
          expect(page).to have_link("View Faculty Member Courses", href: "/faculties/#{@faculty_1.id}/courses")
      end
    end
  end

  describe "User Story 12" do
    describe "When I visit /faculties/:id" do
      it "has a link to the update faculty page" do
          
          visit "/faculties"
  
          expect(page).to have_link("Update Faculty", href: "/faculties/#{@faculty_1.id}/edit")
      end
    end
  end

  describe "User Story 19" do
    describe "When I visit /faculties/:id" do
      it "has a link to delete the faculty" do
            
            visit "/faculties"
    
            expect(page).to have_button("Delete Faculty")
      end
    end
  end
end