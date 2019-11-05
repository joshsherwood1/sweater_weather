class Api::V1::SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create]


  def create
    information = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(email: information[:email])
    if user && user.authenticate(information[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user.api_key).json
    else
      render json: ErrorSerializer.new("Login information incorrect").json
    end
  end

  # def create
  #   information = JSON.parse(request.body.read, symbolize_names: true)
  #   user = User.new(information)
  #   if user.save
  #     user.api_key = SecureRandom.urlsafe_base64
  #     render json: UserSerializer.new(user.api_key).json
  #   else
  #     render json: ErrorSerializer.new(user.errors.full_messages.to_sentence).json
  #   end
  # end
end
