# require_relative "transaction" => a remettre pour utiliser avec la class transaction

# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)
  attr_reader :name, :balance

  MIN_DEPOSIT = 100

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit >= MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    if amount <= 0 || amount < 10
      return "The amount has to be positive and minium 10€"
    elsif amount > @balance
      return "Your balance is too low !"
    # TODO: returns a string with a message
    else
      add_transaction(-amount)
      return "You withdrawn #{amount}€\nYour new balance is #{@balance}€"
    end
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    if amount <= 0 || amount < 10
      return "The amount has to be positive and minimum 10$ of deposit"
    else
      add_transaction(amount)
      return "You made a deposit of #{amount}€\nYour new balance is #{@balance}€"
    end

  end

  def transactions_history(args = {})
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!
    if args.empty?
      return "no password given"
    elsif args[:password] != @password
      return "wrong password"
    else
      transaction_string = "Your transactions :\n"
      @transactions.each_with_index do |transaction, index|
        if transaction.negative?
          transaction_string += "#{index + 1}. (-) #{transaction}\n"
        else
          transaction_string += "#{index + 1}. (+) #{transaction}\n"
        end
      end
      return transaction_string
    end
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    masked_iban = @iban[0, 4] + "**************" + @iban[-3, 3]
    return masked_iban
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: return a string with the account owner, the hidden iban and the balance of the account
    return "Owner: #{@name} - IBAN number: #{self.iban} - Balance: #{@balance}"
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    @transactions << amount              #Transaction.new(amount)
    @balance += amount
    # TODO: update the current balance (which represents the balance of the account)
  end
end
