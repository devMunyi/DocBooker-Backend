require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Creating a new user' do
    it 'should be valid when a user with a unique username is created' do
      new_user = FactoryBot.build(:user)
      expect(new_user).to be_valid
    end

    it 'should not allow the user to be created without a username' do
      new_user = FactoryBot.build(:user, username: nil)
      expect(new_user).not_to be_valid
    end

    it 'should not allow the user to be created when a user with the same username already exists' do
      FactoryBot.create(:user, username: 'testuser')
      new_user = FactoryBot.build(:user, username: 'testuser')
      expect(new_user).not_to be_valid
    end
  end
end
