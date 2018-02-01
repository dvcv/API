class ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # necessary in all controllers that will respond with JSON
  respond_to :json

  private

  # Error responses and before_action blocking work differently with Javascript requests.
  # Rather than using before_actions to authenticate actions, we suggest using
  # "guard clauses" like `permission_denied_error unless condition`
  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end

  def current_user
    current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

  def destroy_session
    session[:current_user_id] = nil
  end

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      user = User.find_by(name: username).try(:authenticate, password)
      if user.present?
        #create_session
        session[:current_user_id] = user.id
        user.present?
      else
        user.present?
      end
    end
  end

end
