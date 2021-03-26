class PicturesController < ApplicationController
#  before_action :set_picture, only: [:show, :update, :destroy]

    def index
    
        # @pictures = Picture.all
      
        # render json: PictureSerializer.new(@pictures).serializable_hash[:data].map{|hash| hash[:attributes]}
        if logged_in?
          @pictures = current_user.pictures
          render json: @pictures, status: :ok
        else
          render json: {
            error: "not logged in", status: :unauthorized
          }
        end
        
    end

    def home 
      if logged_in?
        @pictures = current_user.pictures
        render json: PictureSerializer.new(@pictures).serializable_hash[:data].map{|hash| hash[:attributes]}, status: :ok
      else
        render json: {
          error: "not logged in", status: :unauthorized
        }
      end
    end 



    def show
      @picture = Picture.find(params[:id])
      # render json: PictureSerializer.new(@picture, include: [:reviews])
      hash = PictureSerializer.new(@picture, include: [:reviews]).serializable_hash
      render json: {
        picture: hash[:data][:attributes],
        reviews: hash[:included].map{|review| review[:attributes]}
      }
    end
    
    

    # def show 
    #     @picture = Picture.find(params[:id])
    #     # render json: GroupSerializer.new(@group, include: [:events])
    #     if picture
    #         render json: picture, only: [:id, :image_url, :description],
    #         include: [reviews], only: [:comment]
    #       else
    #       render json: {message: "review does not exist"}
    #     end
    # end 

    def create 
        picture = current_user.pictures.new(picture_params)
        if picture.save
          render json: serializer(picture)
        else
          render json: errors(picture), status: 422
        end
    end

    def update
        if @picture.update(picture_params)
          render json: @picture
        else
          render json: @picture.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /drinks/1
      # def destroy
      #   picture.destroy
      # end
    
    
    private


    def picture_params 
        params.require(:picture).permit(:image_url, :description, :user_id)
    end
end




