require 'rails_helper'

RSpec.describe User, driver: :selenium_chrome, js: true do
  let(:user) { create(:user) }

  describe 'the signin process' do
    it 'signs me in' do
      visit new_user_session_path
      
      within('#new_user') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
