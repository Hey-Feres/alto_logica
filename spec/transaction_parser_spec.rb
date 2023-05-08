# frozen_string_literal: true

require './lib/transaction_parser'

RSpec.describe TransactionParser do
  describe '#call' do
    let!(:parsed_transactions) do
      described_class.call(['2 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85'])
    end

    it 'returns a collection of transaction objects' do
      expect(parsed_transactions.all?(Transaction)).to eq(true)
    end
  end
end
