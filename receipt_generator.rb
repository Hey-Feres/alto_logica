# frozen_string_literal = true

require 'byebug'

class ReceiptGenerator
	EXEMPT_MATCH_TERMS = %w[book chocolate headache pill]
	Transaction = Struct.new(:item_quantity, :item_name, :item_unity_price, :imported, :taxes, :total_amount, keyword_init: true)

	def initialize(transactions)
		@transactions = []

		transactions.each do |transaction|
			item_quantity = transaction.split(' ')[0].to_i
			item_name = transaction.gsub(/\d*\.?\d*/, '').gsub(/ at /, '').strip
			item_unity_price = transaction.split(' ')[-1].to_f.round(2, half: :up)
			taxes = calculate_taxes(item_name, transaction.include?('imported'), item_quantity, item_unity_price)

			@transactions << Transaction.new(
				item_quantity: item_quantity,
				item_name: item_name,
				item_unity_price: item_unity_price,
				imported: transaction.include?('imported'),
				taxes: taxes,
				total_amount: ((item_unity_price * item_quantity) + taxes).round(2, half: :up)
			)
		end
	end

	def print_receipt
		@transactions.each do |transaction|
			puts "#{transaction.item_quantity} #{transaction.item_name}: #{'%.2f' % transaction.total_amount}"
		end

		puts "Sales Taxes: #{'%.2f' % @transactions.map(&:taxes).sum}"
		puts "Total: #{'%.2f' % @transactions.map(&:total_amount).sum}"
	end

	def calculate_taxes(item_name, item_imported, item_quantity, item_unity_price)
		return 0.0 if exempt_product?(item_name) && !item_imported

		total_taxes = 0.0

		if exempt_product?(item_name) && item_imported
			total_taxes += ((item_unity_price * item_quantity) * 0.05).round(2, half: :up)
		elsif !exempt_product?(item_name) && item_imported
			total_taxes += ((item_unity_price * item_quantity) * 0.15).round(2, half: :up)
		else
			total_taxes += ((item_unity_price * item_quantity) * 0.1).round(2, half: :up)
		end

		total_taxes.round(2, half: :up)
	end

	private

	def exempt_product?(item_name)
		EXEMPT_MATCH_TERMS.map { |term| item_name.include?(term) }.any? true
	end
end
