# frozen_string_literal: true

require './lib/receipt_generator'
require './lib/receipt_printer'

RSpec.describe 'The provided test cases' do
  describe 'Input 1' do
    it 'returns the expected data' do
      receipt = ReceiptGenerator.call(['2 book at 12.49',
                                       '1 music CD at 14.99',
                                       '1 chocolate bar at 0.85'])
      expect do
        ReceiptPrinter.call(receipt)
      end.to output("2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n").to_stdout
    end
  end

  describe 'Input 2' do
    it 'returns the expected data' do
      receipt = ReceiptGenerator.call(['1 imported box of chocolates at 10.00',
                                       '1 imported bottle of perfume at 47.50'])
      expect do
        ReceiptPrinter.call(receipt)
      end.to output("1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15\n").to_stdout
    end
  end

  describe 'Input 3' do
    it 'returns the expected data' do
      receipt = ReceiptGenerator.call(['1 imported bottle of perfume at 27.99',
                                       '1 bottle of perfume at 18.99',
                                       '1 packet of headache pills at 9.75',
                                       '3 imported boxes of chocolates at 11.25'])
      expect do
        ReceiptPrinter.call(receipt)
      end.to output("1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported box of chocolates: 35.55\nSales Taxes: 7.90\nTotal: 98.38\n").to_stdout
    end
  end
end
