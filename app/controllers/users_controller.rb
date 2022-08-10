# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user] = @user.id
      redirect_to root_path
    else
      flash[:error_in_user_details] = @user.errors.full_messages.first
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_id, :username, :password)
  end
end
