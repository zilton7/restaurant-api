class ApplicationController < ActionController::API
  include Response

  private

  def secret
    Rails.application.secret_key_base
  end

  def encode_token(payload)
    JWT.encode(payload, secret)
  end

  def decoded_token
    auth = request.headers['Authorization']
    if auth
      token = auth.split(' ')[1]
      JWT.decode(token, secret, true, algorithm: 'HS256')
    end
  rescue StandardError
    nil
  end

  def current_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    User.find_by(id: user_id)
  end

  def authorize
    render json: { message: 'Please log in.' }, status: :unauthorized if current_user.nil?
  end
end
