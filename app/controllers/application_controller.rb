
class ApplicationController < ActionController::Base
     @admin_log = User.find(session[:current_user])


      def user_exists
        @user_log = User.find(session[:current_user])
        @exists = false
         if @auser_log
              @exists = true
         end
         @exists
      end
end
