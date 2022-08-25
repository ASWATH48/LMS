# frozen_string_literal: true

class NewsController < ApplicationController
  @@route_id = []
  def technews; end

  def myblogs
    @user_check = Blog.where(user_id: session[:current_user])
    p @user_check
  end

  def likedblogs
    @liked_blog = Like.where(user_id: session[:current_user])
    @like

  end

  def addpost
    if session[:current_user] == nil
       redirect_to "/signin"
    else
    @blog = Blog.new(params.require(:blog).permit(:user_id, :blog_title, :blog_description))
    redirect_to "/allblogs" if @blog.save
    end
  end

  def delete_blog
    del = Blog.find(params[:id])
    redirect_to root_path if del.destroy
  end

  def edit
    if !params[:id].nil?
      @blog = Blog.find(params[:id])
      @@route_id.push(params[:id])
    else
      @blog = Blog.find(@@route_id[0])
      redirect_to '/news' if @blog.update(params.require(:blog).permit(:blog_title, :blog_description))
    end
  end

  def like_blog
    like_id = params[:like_id]
    like_exist = Like.find_by(user_id: get_user_id, blog_id: like_id).nil?
    if like_exist
      like_record = Like.create!(
        user_id: get_user_id,
        blog_id: like_id
      )
      like_record.save
    end
    redirect_back(fallback_location: root_path)
  end

  def delete
    blog_id = params[:id]
    check_id = Like.find_by(user_id: get_user_id, blog_id: blog_id)
    p blog_id
    p get_user_id
    check_id.inspect
    if check_id
    check_id.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  def get_user_id
    session[:current_user]
  end



  #  p "_____________"
  #  p session[:current_user]
end
