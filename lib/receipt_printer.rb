# frozen_string_literal: true

#
# Class responsible for printing the receipt in the terminal
class ReceiptPrinter
  def self.call(receipt)
    receipt.transactions.each do |transaction|
      puts transaction
    end

    puts "Sales Taxes: #{receipt.total_taxes}"
    puts "Total: #{receipt.total_amount}"
  end
end
