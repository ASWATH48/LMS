# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user_email = params[:email_id]
    check_email = User.find_by(email_id: user_email)
    if check_email&.authenticate(params[:password])
      session[:current_user] = check_email.id
      redirect_to root_path
    else
      flash[:error] = 'User does not Exists'
      redirect_to '/signin'
    end
  end

  def delete
    session[:current_user] = nil
    redirect_to root_path
  end
end
