require 'rails_helper'

describe Product do

  context "average rating returns correct value" do
    let(:product) {Product.create!(name: "race bike", description:"super fancy bike", image_url: "justus.jpg", price: 500, colour:  "white")}
    let(:user) {User.create!(email: "john@email.com", password: "password123")}
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end
  end

  context "is not valid without a name" do
    it "returns not valid" do
      expect(Product.new(description:"super fancy bike", image_url: "justus.jpg", price: 500, colour:  "white")).not_to be_valid
    end
  end

  context "is not valid without a description" do
    it "returns not valid" do
      expect(Product.new(name: "race bike ", image_url: "justus.jpg", price: 500, colour:  "white")).not_to be_valid
    end
  end

  context "is not valid without a image_url" do
    it "returns not valid" do
      expect(Product.new(name: "race bike ", description:"fancy bike", price: 500, colour:  "white")).not_to be_valid
    end
  end

  context "is not valid without a price" do
    it "returns not valid" do
      expect(Product.new(name: "race bike ", description:"fancy bike", image_url: "justus.jpg", colour:  "white")).not_to be_valid
    end
  end

  context "is not valid without a color" do
    it "returns not valid" do
      expect(Product.new(name: "race bike ", description:"fancy bike", image_url: "justus.jpg", price: 400)).not_to be_valid
    end
  end

end
