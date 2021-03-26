class UsersController < ApplicationController

    def index 
        @users = User.all
        render json: UserSerializer.new(@users).serializable_hash[:data].map{|hash| hash[:attributes]}

    end 

    def create
      @user = User.new(user_params)
      
      if @user.save
        render json: @user, status: :created, location: @user
      else
          render json: @user.errors, status: :unprocessable_entity
      end
  end

    def show
        @user = User.find(params[:id])
        hash = UserSerializer.new(@user, include: [:pictures]).serializable_hash
        render json: {
          user: hash[:data][:attributes],
          pictures: hash[:included].map{|picture| picture[:attributes]},
           }
      end

      private


    def user_params 
        params.require(:user).permit(:name, :id, :email, :password)
    end



    def set_user
     @user = User.find(params[:id])
    end

    
end

   



