class Account

  ERROR = {
    valid_number: 'Please enter a valid number amount',
    not_enough_funds: 'You do not have enough funds to withdraw that amount'
  }

  def initialize(balance = 0, transactions = Transactions.new)
    @balance = balance
    @transactions = transactions
  end

  def deposit(amount)
    raise ERROR[:valid_number] unless valid?(amount)

    @balance += amount
    @transactions.entry(amount, @balance, :credit)
    @balance
  end

  def withdraw(amount)
    raise ERROR[:valid_number] unless valid?(amount)
    raise ERROR[:not_enough_funds] unless @balance >= amount

    @balance -= amount
    @transactions.entry(amount, @balance, :debit)
    @balance
  end

  private

  def valid?(amount)
    (amount.is_a? Integer) && amount.positive?
  end
end
