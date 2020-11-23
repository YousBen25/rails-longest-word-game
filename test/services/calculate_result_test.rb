require "application_system_test_case"

class CalculateResultTest < ActionDispatch::IntegrationTest
  test "checking if a world is valid" do
    grid = build_grid("hellohello")
    attempt = "HELLO"
    result = CalculateResult.new(attempt, grid).call
    assert_equal("Congratulation! HELLO is a valid english word", result)
  end

  def build_grid(word)
    word.split("").join(" ").upcase
  end

end
