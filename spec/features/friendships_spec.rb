require 'rails_helper'

RSpec.describe Friendship, driver: :selenium_chrome, js: true do
  let(:user) { User.first }
  let(:friend) { User.second }
  let(:another_friend) { User.third }

  describe 'the send invitation process' do
    it 'should display invitation sent confirmation' do
      login_as(user)
      visit users_path

      click_button 'Add'
      click_button 'Add'
      expect(page).to have_content 'Friendship request was successfully sent.'
    end

    it 'should display invitation acceptance confirmation' do
      login_as(friend)
      visit user_invitations_path

      click_button 'Accept'
      expect(page).to have_content 'Friendship request was successfully sent.'
    end

    it 'should display invitation rejection confirmation' do
      login_as(second_friend)
      visit user_invitations_path

      click_button 'Reject'
      expect(page).to have_content 'Friendship request was successfully rejected.'
    end
  end
end
