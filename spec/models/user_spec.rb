require 'rails_helper'

describe User do
  context "is not valid without without email" do
    it "returns not valid" do
      expect(User.new(password: "1243")).not_to be_valid
    end
  end
  context "is not valid without without password" do
    it "returns not valid" do
      expect(User.new(email: "email@email.com")).not_to be_valid
    end
  end
end
