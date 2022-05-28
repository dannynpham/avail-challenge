class User < ApplicationRecord
  include Authenticatable

  has_secure_password

  class << self
    def with_email(email_to_match)
      where('lower(email) = ?', email_to_match.to_s.downcase).first
    end
  end

  def as_json(options = {})
    super(options.merge({ except: %i[password_digest last_login_at created_at updated_at] }))
  end
end
