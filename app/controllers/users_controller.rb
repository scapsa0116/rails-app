class UsersController < ApplicationController

    def index 
        @users = User.all
        render json: @users
    end 
end


def current_user
    # return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end