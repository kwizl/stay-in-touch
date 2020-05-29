require 'rails_helper'

RSpec.describe Comment do
  let(:user) { create(:user) }
  let(:friend) { create(:user) }

  before(:each) do
    login_as(user)
  end

  describe 'the send invitation process' do
    it 'should change state to pending' do
      visit users_path

      click_button 'Add'

      expect(page).to have_content 'Pending'
    end
  end
end
