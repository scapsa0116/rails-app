class ReviewsController < ApplicationController

    def index  
        @reviews = Review.all 
        render json: @reviews
    end

    

    def create
        review = current_user.reviews.new(review_params)

        if review.save
          render json: serializer(review)
        else
          render json: errors(review), status: 422
        end
      end

      def destroy
        review = current_user.reviews.find(params[:id])

        if review.destroy
          head :no_content
        else
          render json: errors(review), status: 422
        end
      end

      private

      # Strong params
      def review_params
        params.require(:review).permit(:comment, :user_id, :picture_id)
      end
end

def errors(record)
    { errors: record.errors.messages }
  end