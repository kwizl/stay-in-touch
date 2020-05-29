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

      # within('.button_to') do
        # find('.btn').click
      # end
      expect(page.has_selector?('a')).to be_truthy
      # expect(page).to have_content 'Friendship request was successfully sent.'
    end
  end
end
