module RequestHelpers
  module SignInHelpers
    def sign_in_user(user = nil)
      user ||= create(:user, password: 'password')

      post(
        sessions_url,
        params: { session: { email: user.email, password: user.password } }
      )

      user
    end
  end
end
