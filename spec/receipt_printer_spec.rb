# frozen_string_literal: true

require './lib/receipt_printer'
require './lib/receipt_generator'

RSpec.describe ReceiptPrinter do
  describe '#call' do
    it 'prints the desired content' do
      receipt = ReceiptGenerator.call(['2 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85'])
      expect do
        described_class.call(receipt)
      end.to output("2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n").to_stdout
    end
  end
end
