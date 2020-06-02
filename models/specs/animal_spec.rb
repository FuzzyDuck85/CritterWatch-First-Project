require("minitest/autorun")
require('minitest/reporters')
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative("../animal")

class TestAnimal < MiniTest::Test

  def setup
    options = {"id" => 1, "species" => "Robin", "animal_type" => "Bird", "quantity_observed" => 1, "habitat" => "Garden", "season" => "Spring", "time_of_day" => "Morning", "user_id" => user1.id}

    @animal = Animal.new(options)
  end

  def test_species
    result = @animal.species()
    assert_equal("Robin", result)
  end

  def test_animal_type()
    result = @animal.animal_type()
    assert_equal("Bird", result)
  end

  def test_quantity_observed()
    result = @animal.quantity_observed()
    assert_equal(1, result)
  end

  def test_habitat
    result = @animal.habitat()
    assert_equal("Garden", result)
  end

  def test_season()
    result = @animal.season()
    assert_equal("Spring", result)
  end

  def test_time_of_day()
    result = @animal.time_of_day()
    assert_equal("Morning", result)
  end
  #
  # def test_user_id()
  #   result = @animal.user_id()
  #   assert_equal(user1.id, result)
  # end
end
