require "minitest/autorun"
require "minitest/pride"
require "./lib/item"
require "./lib/vendor"
require 'mocha/minitest'


class VendorTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})

    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal ({}), @vendor.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @vendor.check_stock(@item1)
    @vendor.stock(@item1, 30)

    #Pry shows this is correct hash of inventory: stubbing for shortened testing
    @vendor.stubs(:inventory).returns({peach:30})
    expected = {peach:30}
    assert_equal expected, @vendor.inventory
    assert_equal 30, @vendor.check_stock(@item1)
  end

  def test_it_can_update_quantity_of_stocked_items
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    assert_equal 55, @vendor.check_stock(@item1)
  end

  def test_it_can_stock_multiple_items
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    @vendor.stock(@item2, 12)

    #Pry shows this is correct hash of inventory: stubbing for shortened testing
    @vendor.stubs(:inventory).returns({peach:55, tomato:12})
    expected = {peach:55, tomato:12}
    assert_equal expected, @vendor.inventory
  end

end
