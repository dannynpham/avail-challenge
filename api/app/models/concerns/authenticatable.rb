module Authenticatable
  extend ActiveSupport::Concern

  SECRET_CODE = '1111'.freeze

  def authenticate_code(code)
    code == SECRET_CODE
  end
end
