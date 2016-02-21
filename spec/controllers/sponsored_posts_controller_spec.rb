require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  let(:my_sponsoredpost) { my_topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number) }

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to render_template :show
    end

    it "assigns my_sponsoredpost to @sponsoredpost" do
      get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(assigns(:sponsoredpost)).to eq(my_sponsoredpost)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @sponsoredpost" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of SponsoredPost by 1" do
      expect{post :create, topic_id: my_topic_id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_sentence, price: RandomData.random_number}}.to change(SponsoredPost,:count).by(1)
    end

    it "assigns the new sponsoredpost to @sponsoredpost" do
      post :create, topic_id: my_topic_id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number}
      expect(assigns(:sponsoredpost)).to eq SponsoredPost.last
    end

    it "redirects to the new sponsoredpost" do
      post :create, topic_id: my_topic_id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to render_template :edit
    end

    it "assigns sponsoredpost to be updated to @sponsoredpost" do
      get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id

      post_instance = assigns(:sponsoredpost)

      expect(sponsoredpost_instance.id).to eq my_sponsoredpost.id
      expect(sponsoredpost_instance.title).to eq my_sponsoredpost.title
      expect(sponsoredpost_instance.body).to eq my_sponsoredpost.body
      expect(sponsoredpost_instance.price).to eq my_sponsoredpost.price
    end
  end

  describe "PUT update" do
     it "updates sponsoredpost with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       new_price = RandomData.random_number

       put :update, topic_id: my_topic_id, id: my_sponsoredpost.id, sponsoredpost: {title: new_title, body: new_body, price: new_price}

       updated_sponsoredpost = assigns(:sponsoredpost)
       expect(updated_sponsoredpost.id).to eq my_sponsoredpost.id
       expect(updated_sponsoredpost.title).to eq new_title
       expect(updated_sponsoredpost.body).to eq new_body
       expect(updated_sponsoredpost.price).to eq new_price
     end

     it "redirects to the updated sponsoredpost" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       new_price = RandomData.random_number

       put :update, topic_id: my_topic_id, id: my_sponsoredpost.id, sponsoredpost: {title: new_title, body: new_body, price: new_price}
       expect(response).to redirect_to [my_topic, my_sponsoredpost]
     end
   end

end
