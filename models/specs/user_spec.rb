require("minitest/autorun")
require('minitest/reporters')
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative("../user")

class TestUser < MiniTest::Test

  def setup
    options = {"id" => 2, "name" => "Rose", "age" => 6}

    @user = User.new(options)
  end

  def test_name
    result = @user.name()
    assert_equal("Rose", result)
  end

  def test_age()
    result = @user.age()
    assert_equal(6, result)
  end

end
