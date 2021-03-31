class ApplicationController < ActionController::API

    def current_user
      nil
      end

    

      def logged_in?
      !!current_user
      end
  


end

