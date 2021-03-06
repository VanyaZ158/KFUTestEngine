ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'

Minitest::Reporters.use!

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def response_body_to_json
    JSON.parse(@response.body).deep_transform_keys(&:underscore).deep_transform_keys(&:to_sym)
  end

  def full_auth_helper(factory_params: [:teacher])
    auth = OpenStruct.new
    auth.user = create(:user, *factory_params)
    auth.token = token_for auth.user
    auth.headers = auth_headers_for auth.token

    auth
  end

  private

  def token_for(user)
    session = Session.new(username: user.username, password: user.password)
    session.create_token

    session.token
  end

  def auth_headers_for(token)
    { 'Authorization': token }
  end
  # Add more helper methods to be used by all tests here...
end
