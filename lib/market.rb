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

end
