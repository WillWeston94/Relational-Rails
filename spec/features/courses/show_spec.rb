require "rails_helper"

RSpec.describe "Courses show", type: :feature do
  before(:each) do
    @faculty = Faculty.create!(name: "Mr. Fernando Cantillo", department: "Computer Science Information", email: "FCantillo@edu.com", phone: "(918)548-4000", office_hours: true, years_instructing: 18 )
    @faculty_id = @faculty.id
    @course_1= Course.create!(faculty_id: @faculty_id, course_name: "Data Structures", gen_ed: true, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
    @course_2= Course.create!(faculty_id: @faculty_id, course_name: "Big Data", gen_ed: true, credits: 4, start_date: "8-1-2023", end_date: "12-15-2023")
  end

  describe "User Story 4" do
    describe "When I visit /courses/:id" do
      it "displays courses including attributes " do

        visit "/courses/#{@course_1.id}"

        expect(page).to have_content(@course_1.course_name)
        expect(page).to have_content(@course_1.gen_ed)
        expect(page).to have_content(@course_1.credits)
        expect(page).to have_content(@course_1.start_date)
        expect(page).to have_content(@course_1.end_date)
      end
    end
  end

  describe "User Story 14" do
    describe "When i visit the Courses show page" do
      it "has a link to edit that course record called Update Course" do
          
        visit "/courses/##{@course_1.id}"
  
        expect(page).to have_link("Update Course", href: "/courses/#{@course_1.id}/edit")
        end
      end
    end

  describe "User Story 20" do
    describe "When I visit /courses/:id" do
      it "has a link to delete the course" do
              
        visit "/courses/#{@course_1.id}"
      
        expect(page).to have_button("Delete Course")
        end
      end
    end
end