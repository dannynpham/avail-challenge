require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'authenticating' do
    let(:user) { create(:user, password: 'password') }

    context 'with the wrong password' do
      it 'returns false' do
        expect(user.authenticate('wrong password')).to be false
      end
    end

    context 'with the correct password' do
      it 'returns the user' do
        expect(user.authenticate('password')).to eq user
      end
    end
  end

  describe 'finds a user by email' do
    it 'if a user with the email exists' do
      user = create(:user, email: 'find-me@example.com')
      expect(User.with_email('find-me@example.com')).to eq user
    end

    it 'ignoring case' do
      user = create(:user, email: 'find-me@example.com')
      expect(User.with_email('FIND-ME@example.com')).to eq user
    end

    it 'but does not find a user if no user has the email' do
      create(:user, email: 'find-me@example.com')
      expect(User.with_email('OTHER-EMAIL@example.com')).to be_nil
    end

    it 'is ok if nothing is passed in' do
      expect(User.with_email(nil)).to be_nil
    end
  end
end
