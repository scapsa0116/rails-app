class ApplicationController < ActionController::API

  def user_serializer(user)
    { 
      name: user.name,
      email: user.email,
      id: user.id
    }
  end

    def current_user
        @current_user ||= User.find_by(id: JWT.decode(request.headers["Authorization"], "beans")[0]["id"])
      end

    

      def logged_in?
      !!current_user
      end
  

      def generate_token(payload)
        JWT.encode(payload, "beans")
      end


      

end

