require 'rails_helper'

RSpec.describe Post do
  let(:user) { create(:user) }
  before(:each) do
    login_as(user)
  end

  describe 'the create posts process' do
    it 'signs me in' do
      visit root_path
      within('#new_post') do
        fill_in 'Content', with: 'Post no. 1'
      end
      click_button 'Save'
      expect(page).to have_content 'Post was successfully created.'
    end
  end
end
