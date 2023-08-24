require 'rails helper'

RSpec.describe Faculty, type: :model do 
  describe "relationships" do
    it { should have_many :courses }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should allow_value(true).for(:office_hours) }
    it { should allow_value(false).for(:office_hours) }
  end
end