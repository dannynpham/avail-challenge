require 'rails_helper'

RSpec.describe SessionsController do
  describe 'POST /sessions' do
    context 'when no user account found' do
      include_examples 'API returns status and renders', :unprocessable_entity, :error do
        def make_request
          post sessions_url, params: { session: { email: 'no-account@example.com', password: 'password' } }
        end
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

    include_examples 'API returns status and renders', :success, :user do
      def make_request
        post sessions_url,
             params: { session: { email: user.email, password: 'right-password' } }
      end
    end
  end
end
