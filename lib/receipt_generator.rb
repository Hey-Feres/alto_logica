# frozen_string_literal: true

require './lib/receipt'
require './lib/transaction_parser'

#
# Class responsible for call the transaction parser and return the receipt object
class ReceiptGenerator
  def self.call(transactions)
    @parsed_transactions = TransactionParser.call(transactions)

    Receipt.new(transactions: transaction_history,
                total_taxes: total_taxes,
                total_amount: total_amount)
  end

  def self.transaction_history
    @parsed_transactions.map do |transaction|
      "#{transaction.item_quantity} #{transaction.item_name}: #{'%.2f' % transaction.total_amount}"
    end
  end

  def self.total_taxes
    '%.2f' % @parsed_transactions.map(&:taxes).sum
  end

  def self.total_amount
    '%.2f' % @parsed_transactions.map(&:total_amount).sum
  end
end
