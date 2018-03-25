module AuthenticationHelper
  def authenticated_header(user=nil)
    user ||= create(:admin)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    { 'Authorization': "Bearer #{token}" }
  end
end
