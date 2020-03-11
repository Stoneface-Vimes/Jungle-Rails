require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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

  scenario "Cart increases by one" do
    # ACT
    visit root_path
    page.find(:button, "Add", match: :first).click

    
    # VERIFY
    expect(page).to have_text 'My Cart (1)'

    
    # DEBUG
    save_screenshot

  end
end
