require 'securerandom'

class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    information = JSON.parse(request.body.read, symbolize_names: true)
    user = User.new(information)
    if user.save
      user.api_key = SecureRandom.urlsafe_base64
      user.save
      render json: UserSerializer.new(user.api_key).json
    else
      render json: ErrorSerializer.new(user.errors.full_messages.to_sentence).json
    end
  end
end
