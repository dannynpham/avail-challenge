require 'rails_helper'

RSpec.describe SessionsController do
  include RequestHelpers::SignInHelpers

  describe 'POST /sessions' do
    context 'when no user account found' do
      include_examples 'API returns status and renders', :unprocessable_entity, :error do
        def make_request
          post sessions_url, params: { session: { email: 'no-account@example.com', password: 'password' } }
        end
      end
    end

    context 'with invalid credentials' do
      let(:user) { create(:user, password: 'password') }

      include_examples 'API returns status and renders', :unprocessable_entity, :error do
        def make_request
          post sessions_url, params: { session: { email: user.email, password: 'wrong-password' } }
        end
      end
    end

    context 'with valid credentials' do
      let(:user) { create(:user, password: 'right-password') }

      def make_request
        post sessions_url,
             params: { session: { email: user.email, password: 'right-password' } }
      end

      include_examples 'API returns status and renders', :success

      it 'sets the user id in session' do
        make_request
        expect(session[:user_id]).to eq user.id
      end
    end
  end

  describe 'DELETE /sessions' do
    it 'signs the user out' do
      user = sign_in_user
      expect(session[:user_id]).to eq user.id

      delete sessions_url
      expect(session[:user_id]).to be_nil
    end
  end
end
