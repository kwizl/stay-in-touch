require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'Validation tests' do
    let(:user) { build(:user) }

    it 'should save user' do
      expect(user.save).to eq(true)
    end
  end
end
