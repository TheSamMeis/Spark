module Product
  extend self

  def name
    "A cool product"
  end

  def amount
    3500
  end

  def amount_formatted
    amount.to_f/100
  end

end
