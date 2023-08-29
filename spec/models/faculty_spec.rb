require "rails_helper"

RSpec.describe Faculty, type: :model do
  describe "relationships" do
    xit { should have_many :courses }
  end

  describe "validations" do
    xit { should validate_presence_of :name }
  end
end