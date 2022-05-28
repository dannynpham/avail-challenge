module RequestHelpers
  module SignInHelpers
    def get_session(user)
      post(
        sessions_url,
        params: { session: { email: user.email, password: user.password } }
      )
    end

    def get_code_session(_user)
      put(
        sessions_url,
        params: { session: { code: Authenticatable::SECRET_CODE } }
      )
    end

    def sign_in_user(user = nil)
      user ||= create(:user, password: 'password')

      get_session(user)
      get_code_session(user)

      user
    end
  end
end
