require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Post Associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
  context 'Validation tests' do
    let(:user) { create(:user) }
    it 'should save post' do
      data = user.posts.build(:content => 'MyString is String')
      expect(data.save).to be(true)
    end
  end
end
