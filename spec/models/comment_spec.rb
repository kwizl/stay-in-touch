require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Comment Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
  context 'Validation tests' do
    let(:post) { create(:post) }

    it 'should save comment' do
      comment = post.comments.build(:content => 'MyString is String')
      expect(comment.save).to be(true)
    end
  end
end
