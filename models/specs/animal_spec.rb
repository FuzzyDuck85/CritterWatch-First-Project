require("minitest/autorun")
require('minitest/reporters')
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative("../animal")

class TestAnimal < MiniTest::Test

  def setup
    options = {"id" => 1, "species" => "Robin", "animal_type" => "Bird", "quantity_observed" => 1}

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
end
