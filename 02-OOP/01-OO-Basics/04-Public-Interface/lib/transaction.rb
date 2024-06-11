# Optional
class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date = Time.new
  end

  def negative?
    @amount < 0
  end

  def to_s
    # Nicely print transaction info using Time#strftime.
    return "#{@amount}€ on #{@date.strftime("%d/%m/%Y at %I:%M%P")}"
  end
end
