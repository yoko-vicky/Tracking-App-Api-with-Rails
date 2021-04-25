require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Testing validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:username) }
  end

  describe 'Testing associations' do
    it { should have_many(:records).dependent(:destroy) }
    it { should have_many(:items).through(:records) }
  end
end
