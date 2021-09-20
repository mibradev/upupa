class ActionDispatch::IntegrationTest
  def log_in(user, password: "12345678")
    post login_url, params: {email: user.email, password: password}
  end
end
