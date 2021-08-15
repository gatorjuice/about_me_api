# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::API
  def render_created(response)
    render_success(response, :created)
  end

  def render_success(response, status = :ok)
    render json: { data: response, errors: [] }, status: status
  end

  def render_unauthorized(response)
    render_error(response, :unauthorized)
  end

  def render_error(response, status = :error)
    render json: { data: response, errors: [] }, status: status
  end

  def encode_token(payload)
    JWT.encode(payload, 's3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split[1]

    JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
  rescue JWT::DecodeError
    nil
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    !!logged_in_user
  end

  def authorize_user
    render_unauthorized(message: 'Please log in') unless logged_in?
  end
end
