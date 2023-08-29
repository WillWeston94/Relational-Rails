require 'rails_helper'

RSpec.describe "Faculty Index", type: :feature do
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

  describe "User Story 1" do
    describe "When I visit /faculty" do
      it "displays each faculty record in the system" do

        visit '/faculties'

        expect(page).to have_content(@faculty_1.name)
        expect(page).to have_content(@faculty_1.created_at)
        expect(page).to have_content(@faculty_2.name)
        expect(page).to have_content(@faculty_1.created_at)
      end
    end
  end

  describe "User Story 6" do
    describe "When I visit /faculties" do
      it "displays records that are ordered by most recently created first" do
          
          visit '/faculties'
  
          expect("Mr. Mike Rice").to appear_before("Mr. Fernando Cantillo", only_text: true)
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

  describe "User Story 11" do
    describe "When I visit /faculties" do
      it "has a link to to the new faculty page" do

        visit '/faculties'

        expect(page).to have_link("New Faculty", href: "/faculties/new")
      end
    end
  end

  describe "User Story 17" do
    describe "when i visit the faculty index page" do
      it " has a link to edit that faculty record called Update Faculty" do
          
          visit '/faculties'
  
          expect(page).to have_link("Update Faculty", href: "/faculties/#{@faculty_1.id}/edit")
          expect(page).to have_link("Update Faculty", href: "/faculties/#{@faculty_2.id}/edit")
        end
      end
    end
  
  describe "User story 22" do
    describe "when i visit the faculty index page" do
      it "has a link to delete the faculty" do
              
        visit '/faculties'
      
        expect(page).to have_button("Delete Faculty")
        end
      end
    end
end
