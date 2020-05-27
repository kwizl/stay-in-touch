require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Post Associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
  context 'Validation tests' do
    let(:user) { create(:user) }
    let(:post) { build(:post) }
    it 'should save post' do
      data = user.posts.build(post)
      expect(data.save).to be(true)
    end
  end
end
