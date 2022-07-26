require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url # "/"
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "lets a signed in user create a new product" do
    login_as users(:george)

    visit '/products/new'

    fill_in "product_name", with: "Empanada"
    fill_in "product_tagline", with: "Will change your world"

    click_on "Create Product"

    assert_equal root_path, page.current_path
    assert_text "Will change your world"
  end
end
