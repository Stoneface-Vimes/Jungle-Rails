require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "a Product without a name should not be valid" do
      @product = Product.new(
        name: nil,
        category_id: "category",
        price: 10,
        quantity: 20,
      )
      expect(@product).to_not be_valid
    end
    it "a Product without a category should not be valid" do
      @product = Product.new(
        name: "name",
        category_id: nil,
        price: 10,
        quantity: 20,
      )
      expect(@product).to_not be_valid
    end
    it "a Product without a price should not be valid" do
      @product = Product.new(
        name: "name",
        category_id: "category",
        price: nil,
        quantity: 20,
      )
      expect(@product).to_not be_valid
    end
    it "a Product without a quantity should not be valid" do
      @product = Product.new(
        name: "name",
        category_id: "category",
        price: 10,
        quantity: nil,
      )
      expect(@product).to_not be_valid
    end
    it "a Product with a name, category, price and quantity SHOULD be valid" do
      @product = Product.new(
        name: "name",
        category_id: 1,
        price: 10,
        quantity: 20,
      )
      expect(@product).to be_valid
    end
  end
end
