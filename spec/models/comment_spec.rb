require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) { FactoryBot.create(:product)}
    let(:user) { FactoryBot.create(:user)}

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating). to equal(3.0)
    end
  end

  context "when comments being created" do
    let(:product) { FactoryBot.create(:product)}
    let(:user) { FactoryBot.create(:user)}

    before do
      product.comments.build(rating: 1, user: user, body: "")
    end

    it "is not valid without a comment" do
      expect(product).not_to be_valid
    end

  end

  context "when comments being created" do
    let(:product) { FactoryBot.create(:product)}
    let(:user) { FactoryBot.create(:user)}

    before do
      product.comments.build(rating: "", user: user, body: "Great!")
    end

    it "is not valid without a rating" do
      expect(product).not_to be_valid
    end

  end
end
