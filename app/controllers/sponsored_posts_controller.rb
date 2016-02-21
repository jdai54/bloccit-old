class SponsoredPostsController < ApplicationController
  def show
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:id])
    @sponsoredpost = SponsoredPost.new
  end

  def create
    @sponsoredpost = SponsoredPost.new
    @sponsoredpost.title = params[:sponsoredpost][:title]
    @sponsoredpost.body = params[:sponsoredpost][:body]
    @sponsoredpost.price = params[:sponsoredpost][:price]
    @topic = Topic.find(params[:id])
    @sponsoredpost.topic = @topic

    if @sponsoredpost.save
      flash[:notice] = "Post was saved."
      redirect_to [@sponsoredpost.topic, @sponsoredpost]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def update
    @sponsoredpost = SponsoredPost.find(params[:id])
    @sponsoredpost.title = params[:sponsoredpost][:title]
    @sponsoredpost.body = params[:sponsoredpost][:body]
    @sponsoredpost.price = params[:sponsoredpost][:price]

    if @sponsoredpost.save
      flash[:notice] = "Sponsored Post was updated."
      redirect_to @sponsoredpost
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end