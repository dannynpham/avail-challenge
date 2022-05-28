require 'rails_helper'

RSpec.describe SessionsController do
  include RequestHelpers::SignInHelpers

  describe 'GET /users' do
    context 'with valid session returns list of users' do
      include_examples 'API returns status and renders', :success, :user_list do
        def make_request
          sign_in_user
          get users_url
        end
      end
    end

    context 'without valid session returns error' do
      include_examples 'API returns status and renders', :unprocessable_entity, :error do
        def make_request
          get users_url
        end
      end
    end
  end

  describe 'POST /users' do
    context 'with valid params' do
      def make_request
        post users_url(params: { user: { email: 'valid@email.com', password: 'password', name: 'Valid Name',
                                         phone_number: '55555555' } })
      end

      include_examples 'API returns status and renders', :success, :user

      it 'increases user count' do
        expect { make_request }.to(change { User.count })
      end
    end

    context 'with invalid params' do
      def make_request
        post users_url(params: { user: { email: nil, password: nil } })
      end

      include_examples 'API returns status and renders', :unprocessable_entity, :error

      it 'does not increase user count' do
        expect { make_request }.not_to(change { User.count })
      end
    end
  end

  describe 'GET /me' do
    context 'with valid session returns current user' do
      include_examples 'API returns status and renders', :success, :user do
        def make_request
          sign_in_user
          get me_url
        end
      end
    end

    context 'without valid session returns error' do
      include_examples 'API returns status and renders', :unprocessable_entity, :error do
        def make_request
          get me_url
        end
      end
    end
  end
end
