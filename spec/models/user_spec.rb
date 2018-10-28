require 'rails_helper'

describe User do
  context "when new user created" do

    let(:user) { User.create(email: "z@z.ca", password: "zzzzzz")}

    it "is is valid with username and password" do
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      expect(User.new(password: "aaaaaa")).not_to be_valid
    end
    it "is not valid without a six character password" do
      expect(User.new(password: "aaaaaa")).not_to be_valid
    end
  end
end
