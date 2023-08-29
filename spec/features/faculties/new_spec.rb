require 'rails_helper'

RSpec.describe "Faculties New Page", type: :feature do
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