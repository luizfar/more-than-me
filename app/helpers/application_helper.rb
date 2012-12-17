module ApplicationHelper

  def format_money(amount_in_cents, currency = :usd)
    Money.new(amount_in_cents, currency).format(symbol: true)
  end
end
