require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "New Advertisement Title", copy: "New Advertisement Text", price: "New Advertisement Integer") }

  describe "attributes" do
    it "responds to title" do
      expect(advertisement).to respond_to(:title)
    end
    it "resonds to copy" do
      expect(advertisement).to respond_to(:copy)
    end
    it "responds to price" do
      expect(advertisement).to respond_to(:price)
    end
  end
end
