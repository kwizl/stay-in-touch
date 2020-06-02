require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Post Associations' do
    it { should belong_to(:user) }
  end
end
