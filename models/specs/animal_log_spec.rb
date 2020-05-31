require("minitest/autorun")
require('minitest/reporters')
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative("../animal_log")

class TestAnimalLog < MiniTest::test_total

  def setup
    options = {"id" => 1, "species" => "Robin", "animal_type" => "Bird", "quantity_observed" => 1}

    @animal_log = AnimalLog.new(options)
  end

  def test_species
    result = @animal_log.species()
    assert_equal("Robin", result)
  end

  def test_animal_type()
    result = @animal_log.animal_type()
    assert_equal("Bird", result)
  end

  def test_quantity_observed()
    result = @animal_log.quantity_observed()
    assert_equal(1, result)
  end
end
