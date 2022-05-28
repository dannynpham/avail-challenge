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
end
