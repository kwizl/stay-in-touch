require 'rails_helper'

RSpec.describe Like, driver: :selenium_chrome, js: true do
  let(:user) { User.first }

  before(:each) do
    login_as(user)
  end

  it 'should like a post and dislike a post' do
    visit root_path

    within('.post-liking') do
      click_link('Like!')
    end

    expect(page).to have_content 'You liked a post.'

    within('.post-liking') do
      click_link('Dislike!')
    end

    sleep(3)
    expect(page).to have_content 'You disliked a post'
  end
end
