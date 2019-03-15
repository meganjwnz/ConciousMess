require "application_system_test_case"

class RipplesTest < ApplicationSystemTestCase
  setup do
    @ripple = ripples(:one)

    @ripples_array =[]
    i=0
    while i < 1000
      @ripples_array.push(:fix_i)
      i += 1
    end
  end

  test "visiting the index" do
    visit ripples_url
    assert_selector "h1", text: "CONSCIOUS/mess"
  end

  test "going forward on page" do
    visit ripples_url
    
    click_on "Previous 10 Ripples" 
    assert_equal 2, @ripple
  end
end
