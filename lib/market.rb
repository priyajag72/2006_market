class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names = []
    @vendors.each do |vendor|
      names << vendor.name
    end
    names
  end

  def vendors_that_sell(item)
    vendors_with_item = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |vendor_its|
        if vendor_its == item
          vendors_with_item << vendor
        end
      end
    end
    vendors_with_item
  end

  def sorted_item_list
    @item_names = Hash.new{ |hash, key| hash[key] = []}
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |vendor_items|
        if @item_names[vendor_items.name].nil?
          @item_names[vendor_items.name] = vendor
        else
          x = {vendor_items.name => vendor}
          @item_names.merge(x)
        end
      end
    end
    # Currently rewriting the vendors instead of adding
    require "pry"; binding.pry
    @item_names.keys.sort
  end

  def total_inventory
    new = {}
    sorted_item_list
    @item_names.each do |market_items, vendor|
      item_counter = 0
      vendor.inventory.keys.each do |key|
        if key.name == market_items
          item_counter += vendor.inventory[key]
        end
      end
      new[market_items] = item_counter, vendor
    end
  end

end
