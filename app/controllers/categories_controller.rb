class CategoriesController < ApplicationController

  def show
    #find product at given category, for display
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
