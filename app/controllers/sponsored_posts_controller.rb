class SponsoredPostsController < ApplicationController
  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:id])
    @sponsored_post = SponsoredPost.new
  end

  def create
    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:sponsoredpost][:title]
    @sponsored_post.body = params[:sponsoredpost][:body]
    @sponsored_post.price = params[:sponsoredpost][:price]
    @topic = Topic.find(params[:id])
    @sponsored_post.topic = @topic

    if @sponsored_post.save
      flash[:notice] = "Post was saved."
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:sponsoredpost][:title]
    @sponsored_post.body = params[:sponsoredpost][:body]
    @sponsored_post.price = params[:sponsoredpost][:price]

    if @sponsored_post.save
      flash[:notice] = "Sponsored Post was updated."
      redirect_to @sponsored_post
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end
