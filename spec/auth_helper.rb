module AuthHelper
  def http_login
    user = 'user'
    password = 'password'
    {
      HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(user,password)
    }
  end
end
