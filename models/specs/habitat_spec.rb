require("minitest/autorun")
require('minitest/reporters')
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative("../habitat")

class TestHabitat < MiniTest::Test

  def setup
    options = {"id" => 3, "location" => "Garden", "season" => "Spring", "time_of_day" => "Morning"}
    @habitat = Habitat.new(options)
  end

  def test_location
    result = @habitat.location()
    assert_equal("Garden", result)
  end

  def test_season()
    result = @habitat.season()
    assert_equal("Spring", result)
  end

  def test_season()
    result = @habitat.time_of_day()
    assert_equal("Morning", result)
  end

end
