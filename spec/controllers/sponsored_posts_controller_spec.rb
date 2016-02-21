require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_sponsored_post) { Sponsored_Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number) }

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @sponsoredpost" do
      get :new
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of SponsoredPost by 1" do
      expect{post :create, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_sentence}}.to change(SponsoredPost,:count).by(1)
    end

    it "assigns the new sponsoredpost to @sponsoredpost" do
      sponsoredpost :create, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:sponsoredpost)).to eq SponsoredPost.last
    end

    it "redirects to the new sponsoredpost" do
      sponsoredpost :create, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to SponsoredPost.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
