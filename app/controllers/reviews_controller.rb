class ReviewsController < ApplicationController

    def index  
        @reviews = Review.all 
        # render json: @reviews
       # render json: PictureSerializer.new(@picture, include: [:reviews])
        render json: ReviewSerializer.new(@reviews).serializable_hash[:data].map{|hash| hash[:attributes]}

    end

    

    def create
        @review = current_user.reviews.build(review_params)

        if @review.save
          render json: ReviewSerializer.new(@review).serializable_hash[:data][:attributes], status: :created
        else
          render json: @review.errors, status: :unprocessable_entity
        end

      end

      
     


      # def destroy
      #   review = current_user.reviews.find(params[:id])

      #   if review.destroy
      #     head :no_content
      #   else
      #     render json: errors(review), status: 422
      #   end
      # end

      private

      # Strong params
      def review_params
        params.require(:review).permit(:comment, :user_id, :picture_id)
      end
end

def errors(record)
    { errors: record.errors.messages }
  end