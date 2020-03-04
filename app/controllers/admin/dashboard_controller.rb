class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["username"], password: ENV["password"]

  def show
    @categories = Category.all.length
    @products = Product.all.length
  end
end
