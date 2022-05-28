require 'rails_helper'

describe Authenticatable do
  let(:user) { create(:user) }

  describe '#authenticate_code' do
    it 'should return true with a valid code' do
      expect(user.authenticate_code(Authenticatable::SECRET_CODE)).to be_truthy
    end

    it 'should return false with an invalid code' do
      expect(user.authenticate_code('invalid')).to be_falsey
    end

    it 'should return false with no input' do
      expect(user.authenticate_code(nil)).to be_falsey
    end
  end
end
