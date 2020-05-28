require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Comment Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
  context 'Validation tests' do
    let(:user) { create(:user) }
    let(:post) { attributes_for(:post) }
    let(:comment) { attributes_for(:comment) }

    it 'should save comment' do
      user_post = user.posts.create(post)
      comment_test = user_post.comments.build(comment)
      comment_test.user = user
      expect(comment_test.save).to be(true)
    end
  end
end
