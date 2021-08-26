require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should insert correctly' do 
      @category = Category.new(name:"Fun")
      @product = Product.create(name:'clohes', price: 2000, quantity: 2, category: @category)
    end    

    it 'is invalid without a name' do
      @category = Category.new(name:"clothes")
      @product = Product.new(price: 2000, quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is invalid without a price' do
      @category = Category.new(name:"dance")
      @product = Product.new(name:'clothes', quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is invalid without a quantity' do
      @category = Category.new(name:"slide")
      @product = Product.new(name:'clothes', price: 2000, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is invalid without a category' do
      @product = Product.new(name:'clothes', price: 2000, quantity: 2)
      expect(@product).to_not be_valid
    end
  end
end
