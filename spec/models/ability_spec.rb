require 'rails_helper'

describe Ability do
  let(:user) {@user = FactoryGirl.create(:user)}
  context "user admin is false by default" do
    it "returns user admin is false" do
      expect(user.admin).to eq false
    end
  end

  context "user admin is set to true" do
    before do
      user.admin = true
      user.save
    end

    it "returns user admin is true" do
      expect(user.admin).to eq true
    end
  end

end
