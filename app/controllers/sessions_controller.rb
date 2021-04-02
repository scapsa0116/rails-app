class SessionsController < ApplicationController
    

    def create
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])

         session[:user_id] = @user.id


        resp = {
          user: @user.user_serializer
        }
        render json: resp
      else
        resp = {
            error: "Email or password is invalid",
            details: @user.errors.full_messages
        } 
        render json: resp, status: :unauthorized
      end
    end

    def destroy
      if session.clear
      render json: {
        message: "succesfuly logged out"
      }, status: :ok
      else 
        render json: { 
         error: "something Went Wrong"
        }, status: 500
    end
  end



def get_current_user
  if logged_in?
  render json: {
    user: current_user.user_serializer
    }, status: :ok
  else
    render json: {error: "No current user"}
  end
 end


end
