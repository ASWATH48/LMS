# frozen_string_literal: true

class NewsController < ApplicationController
  @@route_id = []
  def technews; end

  def addpost
    @blog = Blog.new(params.require(:blog).permit(:user_id, :blog_title, :blog_description))
    redirect_to root_path if @blog.save
  end

  def delete
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

  def get_user_id
    session[:current_user]
  end

  #  p "_____________"
  #  p session[:current_user]
end
