require 'rails_helper'

describe Order do
  context "user_id, product_id and total present" do
    let(:order) {Order.new(user_id: 1, product_id:2, total: 400)}

    it "should return user_id, product_id and total" do
      expect([order.user_id, order.product_id, order.total]).to eq [1,2,400]
    end
  end

  context "user_id and product_id present" do
    let(:order) {Order.new(user_id: 1, product_id:2)}

    it "should return user_id, product_id" do
      expect([order.user_id, order.product_id, order.total]).to eq [1,2, nil]
    end
  end

  context "product_id and total present" do
    let(:order) {Order.new(product_id:2, total: 400)}

    it "should return product_id and total" do
      expect([order.user_id, order.product_id, order.total]).to eq [nil, 2,400]
    end
  end

  context "user_id and total present" do
    let(:order) {Order.new(user_id:1, total: 400)}

    it "should return user_id and total" do
      expect([order.user_id, order.product_id, order.total]).to eq [1,nil,400]
    end
  end

  context "order created blank" do
    let(:order) {Order.new()}

    it "should return user_id and total" do
      expect([order.user_id, order.product_id,order.total]).to eq [nil, nil, nil]
    end
  end
end
