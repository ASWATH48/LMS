# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def is_admin
        @admin_log = User.find(session[:current_user])
        @is_exist = false
         if @admin_log.username == "admin123"
              @is_exist = true
         end
         @is_exist
      end
      def user_exists
        @user_log = User.find(session[:current_user])
        @exists = false
         if @auser_log
              @exists = true
         end
         @exists
      end
end
