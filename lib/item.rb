class Item

  attr_reader :name, :price

  def initialize(item_details)
    @name = item_details[:name]
    @price = item_details[:price].gsub(/[^\d\.]/, '').to_f
  end
end
