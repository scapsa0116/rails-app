class ApplicationController < ActionController::API

  def user_serializer(user)
    { 
      name: user.name,
      email: user.email,
      id: user.id
    }
  end

    def current_user
        @current_user ||= User.find_by(id: decode_token_and_get_user_id)
      end

    

      def logged_in?
      !!current_user
      end
  

      def generate_token(payload)
        JWT.encode(payload, "beans")
      end


      def decode_token_and_get_user_id
        JWT.decode(request.headers["Authorization"], "beans")[0]["id"]
      end 

end

