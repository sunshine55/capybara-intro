module MagentoHelper
  
  def go_to_category name
  	click_link name
  end

  def navigate_product name
  	first(:xpath, "//a[@title='"+name+"']").click
  end

  def check_cart info
  	if !info[:notification].empty?
  	  page.has_text? info[:notification]
  	end
  	page.has_text? info[:subtotal]
  	page.has_text? info[:grandtotal]
  end

  def set_quantity qty
    first('input.qty').set qty
  end

  def remove_item
    within(:xpath, "//table/tbody/tr[@class='last even']") do
      click_link 'Remove item'
    end
  end
end