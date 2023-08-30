require "rails_helper"

RSpec.describe Faculty, type: :model do
  describe "relationships" do
    it { should have_many :courses }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :department }
    it { should validate_presence_of :email }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :office_hours }
    it { should validate_presence_of :years_instructing }
  end
end