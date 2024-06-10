class VendingMachine
  # TODO: add relevant getter/setter to this class to make the scenarios work properly.
    attr_reader :snack_price_cents
    attr_accessor :snack_count, :user_balance_cents

  def initialize(snack_price_cents, snack_count)
    @user_balance_cents = 0
    @snack_count = snack_count
    @snack_price_cents = snack_price_cents
  end

  def insert_coin(input_cents)
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user inserts a coin?
    @user_balance_cents += input_cents
  end

  def buy_snack
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user pushes a button to buy a Snack?
    if @snack_count < 1
      puts "Sorry out of stock !"
      return
    end

    if @user_balance_cents >= @snack_price_cents
      puts "Thanks for your purchase !"
      @snack_count -= 1
      @user_balance_cents -= @snack_price_cents
    else
      puts "Sorry your balance is too low, insert more coins to purchase.\n"
      return
    end
  end
end
