require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
          @category.products.create!(
            name:  Faker::Hipster.sentence(3),
            description: Faker::Hipster.paragraph(4),
            image: open_asset('apparel1.jpg'),
            quantity: 10,
            price: 64.99
          )
    end
    
  end
  
  scenario "They can navigate to the product detail, on click" do
    # ACT
    visit root_path

    myProduct = all("article header h4").first.click 
  
    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_css("section.products-show")  
  end
end
