class ActionDispatch::IntegrationTest
  def log_in(user, password: "mysecret")
    post login_url, params: {email: user.email, password: password}
  end
end
