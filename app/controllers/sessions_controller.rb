class SessionsController < ApplicationController
    

    def create
        # binding.pry
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        token = generate_token({id: @user.id})

        resp = {
          user: user_serializer(@user),
          jwt: token
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
      session[:user_id] = nil
      redirect_to root_url, notice: "Logged out!"
    end



def get_current_user
  if logged_in?
  render json: {
    user: user_serializer(current_user)
    }, status: :ok
  else
    render json: {error: "No current user"}
  end
 end
end
