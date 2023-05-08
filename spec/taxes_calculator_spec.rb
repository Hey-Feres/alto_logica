# frozen_string_literal: true

require './lib/receipt_generator'

RSpec.describe TaxesCalculator do
  describe '#calculate' do
    context 'when product is exempt' do
      it 'does not apply taxes' do
        taxes = described_class.call('book', false, 2, 12.49)
        expect(taxes).to eq(0.0)
      end
    end

    context 'when product is not exempt' do
      it 'applies 10% of taxes' do
        taxes = described_class.call('music cd', false, 1, 14.99)
        expect(taxes).to eq(1.5)
      end
    end

    context 'when product is exempt but is imported' do
      it 'applies 5% of taxes' do
        taxes = described_class.call('box of chocolates', true, 1, 10.00)
        expect(taxes).to eq(0.5)
      end
    end

    context 'when product is not exempt and is imported' do
      it 'applies 15% of taxes' do
        taxes = described_class.call('bottle of perfume', true, 1, 47.50)
        expect(taxes).to eq(7.13)
      end
    end
  end
end
