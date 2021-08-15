# frozen_string_literal: true

module RequestSpecHelper
  private

  def parsed_response
    JSON.parse(response.body)
  end

  def login_user_for_token(username, password)
    post api_v1_login_path, params: { username: username, password: password }
    parsed_response.fetch('token')
  end
end
