require 'rails_helper'

RSpec.describe User, driver: :selenium_chrome, js: true do
  let(:user) { create(:user) }

  describe 'the signin process' do
    it 'signs user in' do
      visit new_user_session_path

      within('#new_user') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'signs out user' do
      login_as(user)
      visit root_path

      within('.nav') do
        click_link('Sign out')
      end

      expect(page).to have_content 'Sign in'
      sleep(3)
    end
  end
end
