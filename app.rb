require 'byebug'
require './receipt_generator'

puts 'Input the products (press enter on an empty line when you are done): '
items = []
input = nil

while input != ''
  input = gets.chomp
  items << input if input != ''
end

ReceiptGenerator.new(items).print_receipt
