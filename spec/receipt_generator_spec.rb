# frozen_string_literal: true

require 'pry'
require './lib/receipt_generator'

RSpec.describe ReceiptGenerator do
  let!(:generated_receipt) do
    described_class.call(['2 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85'])
  end

  describe '#call' do
    it 'return an instance of receipt' do
      expect(generated_receipt).to be_an_instance_of Receipt
    end

    it 'return transaction history in the receipt instance' do
      expect(generated_receipt.transactions).to eq(['2 book: 24.98', '1 music CD: 16.49', '1 chocolate bar: 0.85'])
    end

    it 'return total taxes in the receipt instance' do
      expect(generated_receipt.total_taxes).to eq('1.50')
    end

    it 'return total amount in the receipt instance' do
      expect(generated_receipt.total_amount).to eq('42.32')
    end
  end
end
