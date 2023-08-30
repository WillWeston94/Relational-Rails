require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "relationships" do
    it { should belong_to :faculty }
  end

  describe "validations" do
    # it { should validate_presence_of :professor }
    it { should validate_presence_of :course_name }
    it { should validate_presence_of :credits }
    # it { should validate_presence_of :gen_ed }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
  end
end