require 'rails_helper'

describe Comment do
  context "is not valid without a body" do
    it "returns not valid" do
      expect(Comment.new(user_id: 1, product_id: 1, rating: 1, )).not_to be_valid
    end
  end

  context "is not valid without a user_id" do
    it "returns not valid" do
      expect(Comment.new(body:"blaa", product_id: 1, rating: 1, )).not_to be_valid
    end
  end

  context "is not valid without a product_id" do
    it "returns not valid" do
      expect(Comment.new(body:"blaa", user_id: 1, rating: 1, )).not_to be_valid
    end
  end

  context "is not valid without a rating" do
    it "returns not valid" do
      expect(Comment.new(body:"blaa", product_id: 1, user_id: 1, )).not_to be_valid
    end
  end
end
