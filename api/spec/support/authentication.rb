module AuthenticationHelper
  def authenticated_header(user=nil)
    user ||= User.create!({
      email: 'authenticated_user@example.com',
      password: 'pass',
      password_confirmation: 'pass'
    })
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    { 'Authorization': "Bearer #{token}" }
  end
end
