require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:sponsoredpost) { SponsoredPost.create!(title: "New Sponsored Post Title", body: "New Sponsored Post Body", price: "New Sponsored Post Price") }

  describe "attributes" do
    it "responds to title" do
      expect(sponsoredpost).to respond_to(:title)
    end
    it "responds to body" do
      expect(sponsoredpost).to respond_to(:body)
    end
    it "responds to price" do
      expect(sponsoredpost).to respond_to(:price)
    end
  end
end
