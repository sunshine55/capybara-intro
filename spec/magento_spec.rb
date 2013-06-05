
require 'spec_helper.rb'

feature "Category" do

  background do
    visit '/'
  end

 scenario "Add a simple product to cart" do
   go_to_category 'Furniture'
   navigate_product 'Chair'
   click_button 'Add to Cart'
   check_cart :notification => 'Chair was added to your shopping cart.', :subtotal => '$99.99', :grandtotal => '$99.99'
 end

  scenario "Add a configured product to cart" do
    go_to_category 'Apparel'
    navigate_product 'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'
    select('Small', :from => 'attribute525')
    select('Green +$5.25', :from => 'attribute272')
    click_button 'Add to Cart'
    check_cart :notification => 'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt was added to your shopping cart.', :subtotal => '$18.75', :grandtotal => '$18.75'
  end
end


feature "Shopping cart" do

  background do
    visit '/'
  end
  
  scenario "Update cart" do
    go_to_category 'Furniture'
    navigate_product 'Chair'
    click_button 'Add to Cart'

    go_to_category 'Apparel'
    navigate_product 'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'
    select('Small', :from => 'attribute525')
    select('Green +$5.25', :from => 'attribute272')
    click_button 'Add to Cart'

    set_quantity '9'
    click_button 'Update Shopping Cart'
    check_cart :notification => '', :subtotal => '$918.66', :grandtotal => '$918.66'
  end

  scenario "Remove item" do
    go_to_category 'Furniture'
    navigate_product 'Chair'
    click_button 'Add to Cart'

    go_to_category 'Apparel'
    navigate_product 'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'
    select('Small', :from => 'attribute525')
    select('Green +$5.25', :from => 'attribute272')
    click_button 'Add to Cart'

    remove_item
    check_cart :notification => '', :subtotal => '$99.99', :grandtotal => '$99.99'
  end

  scenario "Clear cart" do
    go_to_category 'Furniture'
    navigate_product 'Chair'
    click_button 'Add to Cart'

    go_to_category 'Apparel'
    navigate_product 'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'
    select('Small', :from => 'attribute525')
    select('Green +$5.25', :from => 'attribute272')
    click_button 'Add to Cart'

    click_button 'Clear Shopping Cart'
    page.has_text? 'Shopping Cart is Empty'
  end
end