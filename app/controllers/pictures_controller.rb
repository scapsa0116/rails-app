class PicturesController < ApplicationController
#  before_action :set_picture, only: [:show, :update, :destroy]

    def index
        @pictures = Picture.all
        render json: PictureSerializer.new(@pictures).serializable_hash[:data].map{|hash| hash[:attributes]}        
    end

    def home 
      if logged_in?
        @pictures = current_user.pictures
        render json: PictureSerializer.new(@pictures).serializable_hash[:data].map{|hash| hash[:attributes]}        

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
      # hash = PictureSerializer.new(@picture, include: [:reviews]).serializable_hash
      # render json: {
      #   id: hash[:data][:attributes][:id],
      #   image_url: hash[:data][:attributes][:image_url],
      #   description: hash[:data][:attributes][:description]
      #   reviews: hash[:included].map{|review| review[:attribute]}
      # }
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
        @picture = current_user.pictures.build(picture_params)
        if @picture.save
          render json: PictureSerializer.new(@picture).serializable_hash[:data][:attributes], status: :created        

        else
          render json: @picture.errors, status: :unprocessable_entity
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
        params.require(:picture).permit(:image, :description, :user_id)
    end
end




