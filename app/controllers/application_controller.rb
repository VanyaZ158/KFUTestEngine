class ApplicationController < ActionController::API
  include Pundit

  rescue_from JWE::DecodeError, with: :bad_token_handler
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_handler
  rescue_from Pundit::NotAuthorizedError, with: :permissions_handler

  protected

  def bad_token_handler
    @message_path = 'errors.login_required'
    render 'v1/service_errors/basic_error', status: :unauthorized
  end

  def not_found_handler
    @message_path = 'errors.record_not_found'
    render 'v1/service_errors/basic_error', status: :not_found
  end

  def permissions_handler(exception)
    @message_path = "pundit.#{exception.query}"
    render 'v1/service_errors/basic_error', status: :unauthorized
  end

  def current_user
    session = Session.new(token: request.headers.fetch('Authorization', ''))
    session.user_from_token
  end
end
