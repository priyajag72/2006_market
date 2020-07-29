class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    @inventory[item] = quantity
  end

  def check_stock(item)
    if @inventory.empty?
      0
    else
      @inventory
    end
  end
end
