class Account
  attr_reader :balance

  def initialize(balance = 0, transactions = Transactions.new)
    @balance = balance
    @transactions = transactions
  end

  def deposit(amount)
    raise 'Please enter a valid number amount' unless valid?(amount)

    @balance += amount
    @transactions.deposit(amount, @balance)
    @balance
  end

  def withdraw(amount)
    raise 'Please enter a valid number amount' unless valid?(amount)
    raise 'You do not have enough funds to withdraw that amount' unless @balance >= amount

    @balance -= amount
    @transactions.withdraw(amount, @balance)
    @balance
  end

  private

  def valid?(amount)
    (amount.is_a? Integer) && amount.positive?
  end
end
