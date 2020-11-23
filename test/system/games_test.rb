require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    divs = page.find_all(".letter")
    assert_equal(10, divs.size)
  end
end
