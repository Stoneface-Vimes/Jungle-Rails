require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset("apparel1.jpg"),
      quantity: 10,
      price: 64.99
    )
    end
  end


  scenario "They see a product page" do
    # ACT
    visit root_path
    temp = Product.all[9]
    p temp
    p temp.name
    page.find(:link, "#{temp.name}").click

    
    # VERIFY
    expect(page).to have_selector 'section.products-show'

    
    # DEBUG
    save_screenshot

  end
end
