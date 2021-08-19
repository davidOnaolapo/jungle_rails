class Admin::DashboardController < ApplicationController
  def show
    @no_of_products = Product.count
    @no_of_categories = Category.count
  end
end
