require 'rails_helper'

describe User do

  context "user is created without password" do
    it "should not validate users without password" do
      @user = FactoryGirl.build(:user, password: "")
      expect(@user).to_not be_valid
      # expect(User.new(email: "email@email.com")).not_to be_valid
    end
  end

  context "user email is not valid" do
    it "should not validate users without proper email address" do
      @user = FactoryGirl.build(:user, email: "not_an_email")
      expect(@user).to_not be_valid
    end
  end
end
