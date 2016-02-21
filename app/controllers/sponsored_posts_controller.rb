class SponsoredPostsController < ApplicationController
  def show
  end

  def new
    @sponsoredpost = SponsoredPost.new
  end

  def create
    @sponsoredpost = SponsoredPost.new
    @sponsoredpost.title = params[:sponsoredpost][:title]
    @sponsoredpost.body = params[:sponsoredpost][:body]
    @sponsoredpost.price = params[:sponsoredpost][:price]

    if @sponsoredpost.save
      flash[:notice] = "Post was saved."
      redirect_to @sponsoredpost
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
  end
end
