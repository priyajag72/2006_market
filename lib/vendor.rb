class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new{ |hash, key| hash[key] = 0}
  end

  def check_stock(item)
    if @inventory.empty? || @inventory[item] == 0
      return 0
    else
      @inventory[item]
    end
  end

  def stock(item, quantity)
    if @inventory[item] == 0
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
  end
end
