module Abingo::ConversionRate
  def conversion_rate
    1.0 * conversions / participants
  end

  def pretty_conversion_rate
    sprintf("%4.2f%%", conversion_rate * 100)
  end
end
