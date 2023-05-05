# frozen_string_literal = true

require './receipt_generator'

RSpec.describe ReceiptGenerator do
  describe '#print_receipt' do
    it 'print the desired content' do
      expect do
        described_class.new(['2 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85']).print_receipt
      end.to output("2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n").to_stdout
    end
  end

  describe '#calculate_taxes' do
    context 'when product is exempt' do
      it 'does not apply taxes' do
        taxes = described_class.new([]).calculate_taxes('book', false, 2, 12.49)
        expect(taxes).to eq(0.0)
      end
    end

    context 'when product is not exempt' do
      it 'applies 10% of taxes' do
        taxes = described_class.new([]).calculate_taxes('music cd', false, 1, 14.99)
        expect(taxes).to eq(1.5)
      end
    end

    context 'when product is exempt but is imported' do
      it 'applies 5% of taxes' do
        taxes = described_class.new([]).calculate_taxes('box of chocolates', true, 1, 10.00)
        expect(taxes).to eq(0.5)
      end
    end

    context 'when product is not exempt and is imported' do
      it 'applies 15% of taxes' do
        taxes = described_class.new([]).calculate_taxes('bottle of perfume', true, 1, 47.50)
        expect(taxes).to eq(7.13)
      end
    end
  end
end
