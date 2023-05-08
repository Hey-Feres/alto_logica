# frozen_string_literal: true

require './lib/receipt_generator'
require './lib/receipt_printer'

puts 'Input the products (press enter on an empty line when you are done): '
items = []
input = nil

while input != ''
  input = gets.chomp
  items << input if input != ''
end

receipt = ReceiptGenerator.call(items)
ReceiptPrinter.call(receipt)
