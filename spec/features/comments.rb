require 'rails_helper'

RSpec.describe Comment do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:comment) { attributes_for(:comment) }
  before(:each) do
    login_as(user)
  end

  describe "the create comments process" do
    it "should create a comment" do
      visit root_path

      within("#new_post") do
        fill_in 'Content', with: post[:content]
      end

      click_button 'Save'

      within("#new_comment") do
        fill_in with: comment[:content], id: 'comment_content'
      end
      click_button 'Comment'
      expect(page).to have_content 'Comment was successfully created.'
    end
  end
end
