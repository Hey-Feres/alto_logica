# frozen_string_literal: true

require './lib/transaction'
require './lib/taxes_calculator'

#
# Class responsible for parsing the string received from user input
class TransactionParser
  def self.call(transactions)
    transactions.map do |transaction|
      parse_data(transaction)

      Transaction.new(item_quantity: @item_quantity,
                      item_name: @item_name,
                      item_unity_price: @item_unity_price,
                      imported: transaction.include?('imported'),
                      taxes: @taxes,
                      total_amount: @total_amount)
    end
  end

  def self.parse_data(transaction)
    parse_item_name(transaction)
    parse_item_unity_price(transaction)
    parse_item_quantity(transaction)
    calculate_taxes(transaction)
    calculate_total_amount
  end

  def self.parse_item_name(transaction)
    @item_name = transaction.gsub(/\d*\.?\d*/, '')
                            .gsub(/ at /, '')
                            .strip
  end

  def self.parse_item_unity_price(transaction)
    @item_unity_price = transaction.split(' ')
                                   .last
                                   .to_f
  end

  def self.parse_item_quantity(transaction)
    @item_quantity = transaction.split(' ')
                                .first
                                .to_i
  end

  def self.calculate_taxes(transaction)
    @taxes = TaxesCalculator.call(@item_name,
                                  transaction.include?('imported'),
                                  @item_quantity,
                                  @item_unity_price)
  end

  def self.calculate_total_amount
    @total_amount = ((@item_unity_price * @item_quantity) + @taxes)
  end
end
