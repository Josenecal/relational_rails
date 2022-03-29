require 'rails_helper'

RSpec.describe School do

  describe 'Validation' do

    it { should validate_presence_of :name }
    it { should validate_presence_of :mailing_address }
    it { should validate_presence_of :max_student_capacity }
    it { should validate_presence_of :state_rating }
    it { should validate_presence_of :calendar_structure }
    it { should validate_presence_of :grades_served }

  end

  describe 'Relationships' do

    it { should have_many :staff_members }
  end
end
