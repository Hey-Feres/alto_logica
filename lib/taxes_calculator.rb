# frozen_string_literal: true

#
# Class responsible for calculating the taxes for each criteria
class TaxesCalculator
  EXEMPT_MATCH_TERMS = %w[book chocolate headache pill].freeze

  def self.call(item_name, item_imported, item_quantity, item_unity_price)
    return 0.0 if exempt_product?(item_name) && !item_imported

    if exempt_product?(item_name) && item_imported
      ((item_unity_price * item_quantity) * 0.05).round(2)
    elsif !exempt_product?(item_name) && item_imported
      ((item_unity_price * item_quantity) * 0.15).round(2)
    else
      ((item_unity_price * item_quantity) * 0.1).round(2)
    end
  end

  def self.exempt_product?(item_name)
    EXEMPT_MATCH_TERMS.map { |term| item_name.include?(term) }.any? true
  end
end
