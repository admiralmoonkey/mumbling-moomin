require 'rails_helper'

describe Ability do
  context "user admin is false by default" do
    let(:user) {User.create!(email: "john@email.com", password: "password123")}

    it "returns user admin is false" do
      expect(user.admin).to eq false
    end
  end

  context "user admin is set to true" do
    let(:user) {User.create!(email: "john@email.com", password: "password123")}
    before do
      user.admin = true
      user.save
    end

    it "returns user admin is true" do
      expect(user.admin).to eq true
    end
  end
    
end
