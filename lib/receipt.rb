# frozen_string_literal: true

#
# Receipt model
class Receipt
  attr_accessor :transactions, :total_taxes, :total_amount

  def initialize(transactions:, total_taxes:, total_amount:)
    @transactions = transactions
    @total_taxes  = total_taxes
    @total_amount = total_amount
  end
end
