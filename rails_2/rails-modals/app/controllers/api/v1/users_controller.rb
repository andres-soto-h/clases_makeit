class Api::V1::UsersController < ApplicationController

  def authentication
    user = authenticate(params[:email], params[:password])
    if user
      render json: { auth_token: user.auth_token }
    else
      render json: {auth_token: 'Invalid Authentication'}, status: :unauthorized
    end
  end

  def authenticate(username, password)
    @user = User.find_for_authentication(email: username)
    @user.valid_password?(password) ? @user : nil
  end
end
