require 'securerandom'

class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      user.api_key = SecureRandom.urlsafe_base64
      render json: UserSerializer.new(user.api_key).json
    else
      render json: ErrorSerializer.new(user.errors.full_messages.to_sentence).json
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
