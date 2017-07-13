require 'rails_helper'

describe Product do
  # METHOD TESTS
  context "average rating returns correct value" do
    let(:user) {@user = FactoryGirl.create(:user)}
    let(:product) {@product = FactoryGirl.create(:product)}

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end
  end

  context "highest_rating returns correct value" do
    let(:user) {@user = FactoryGirl.create(:user)}
    let(:product) {@product = FactoryGirl.create(:product)}

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the highest rating of all comments" do
      expect(product.highest_rating_comment.rating).to eq 5
    end
  end

  context "lowest_rating returns correct value" do
    let(:user) {@user = FactoryGirl.create(:user)}
    let(:product) {@product = FactoryGirl.create(:product)}

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the lowest rating of all comments" do
      expect(product.lowest_rating_comment.rating).to eq 1
    end
  end

  #VALIDATIONS TESTS
  context "is created without a name" do
    it "returns not valid" do
      # expect(Product.new(description:"super fancy bike", image_url: "justus.jpg", price: 500, colour:  "white")).not_to be_valid
      @product = FactoryGirl.build(:product, name: "")
      expect(@product).to_not be_valid
    end
  end

  context "is created without a description" do
    it "returns not valid" do
      # expect(Product.new(name: "race bike ", image_url: "justus.jpg", price: 500, colour:  "white")).not_to be_valid
      @product = FactoryGirl.build(:product, description: "")
      expect(@product).to_not be_valid
    end
  end

  context "is created without a image_url" do
    it "returns not valid" do
      # expect(Product.new(name: "race bike ", description:"fancy bike", price: 500, colour:  "white")).not_to be_valid
      @product = FactoryGirl.build(:product, image_url: "")
      expect(@product).to_not be_valid
    end
  end

  context "is created without a price" do
    it "returns not valid" do
      # expect(Product.new(name: "race bike ", description:"fancy bike", image_url: "justus.jpg", colour:  "white")).not_to be_valid
      @product = FactoryGirl.build(:product, price: "")
      expect(@product).to_not be_valid
    end
  end

  context "is created without a color" do
    it "returns not valid" do
      # expect(Product.new(name: "race bike ", description:"fancy bike", image_url: "justus.jpg", price: 400)).not_to be_valid
      @product = FactoryGirl.build(:product, colour: "")
      expect(@product).to_not be_valid
    end
  end

end
