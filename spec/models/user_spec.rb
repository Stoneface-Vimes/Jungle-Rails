require "rails_helper"
RSpec.describe User, type: :model do
  describe "Validations" do
    it "a user without a first name should not be valid" do
      @user = User.new(
        first_name: nil,
        last_name: "last_name",
        password: "password",
      )
      expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    # examples for this class method here
  end
end
