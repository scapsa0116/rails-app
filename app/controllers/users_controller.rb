class UsersController < ApplicationController

    def index 
        @users = User.all
        render json: UserSerializer.new(@users).serializable_hash[:data].map{|hash| hash[:attributes]}

    end 

    def show
        @user = User.find(params[:id])
        # render json: PictureSerializer.new(@picture, include: [:reviews])
        # hash = UserSerializer.new(@user, include: [:pictures]).serializable_hash
        # render json: {
        #   user: hash[:data][:attributes],
        #   pictures: hash[:include].map{|picture| picture[:attribute]},
        # #   reviews: hash[:included].map{|review| review[:attributes]}
        # }

        render json: @user.to_json(only: [:name, :id],
        include: [pictures: {only: [:image_url, :description]}])
      end

      private


    def user_params 
        params.require(:user).permit(:name)
    end
end

   


def current_user
    # return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end


