require "test_helper"

class CityTest < ActiveSupport::TestCase
  # region Required properties validations
  test "should validate city with name and zip" do
    assert cities(:lausanne).valid?
  end
  # endregion

  # region Name validations
  test "should not validate city without name" do
    city = City.new
    city.valid?
    assert_equal city.errors[:name], ["can't be blank"]
  end
  # endregion

  # region Zip validations
  test "should validate city with zip 1000" do
    city = cities(:lausanne)
    city.valid?
    assert city.errors[:zip].empty?
  end

  test "should validate city with zip 9498 (last known zip)" do
    city = cities(:planken)
    city.valid?
    assert city.errors[:zip].empty?
  end

  test "should not validate city without zip" do
    city = City.new
    city.valid?
    assert_equal city.errors[:zip], ["can't be blank", "is not a number"]
  end

  test "city zip should be an integer" do
    city = City.new
    city.zip = 1000.5
    city.valid?
    assert_equal city.errors[:zip], ["must be an integer"]
  end

  test "should validate city zip 9999" do
    city = City.new
    city.zip = 9999
    city.valid?
    assert city.errors[:zip].empty?
  end

  test "should not validate city zip less than or equal to 1000" do
    city = City.new
    city.zip = 999
    city.valid?
    assert_equal city.errors[:zip], ["must be greater than or equal to 1000"]
  end

  test "should not validate city zip greater than or equal to 9999" do
    city = City.new
    city.zip = 10_000
    city.valid?
    assert_equal city.errors[:zip], ["must be less than or equal to 9999"]
  end

  test "should not validate city zip with letters" do
    city = City.new
    city.zip = 'ch-1234'
    city.valid?
    assert_equal city.errors[:zip], ["is not a number"]
  end
  # endregion
end
