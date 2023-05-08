# frozen_string_literal: true

#
# Transaction model
class Transaction
  attr_accessor :item_quantity, :item_name, :item_unity_price, :imported, :taxes, :total_amount

  def initialize(item_quantity:, item_name:, item_unity_price:, imported:, taxes:, total_amount:)
    @item_quantity    = item_quantity
    @item_name        = item_name
    @item_unity_price = item_unity_price
    @imported         = imported
    @taxes            = taxes
    @total_amount     = total_amount
  end
end
