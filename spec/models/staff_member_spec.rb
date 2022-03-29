require 'rails_helper'
RSpec.describe StaffMember do

  describe 'Validation' do

    it { should validate_presence_of :role }
    it { should validate_presence_of :pay_rate }
    it { should validate_presence_of :pay_type }
    it { should validate_presence_of :department }
    it { should validate_presence_of :courses }

  end

  describe 'Relationships' do

    it { should belong_to :school }
  end
end
