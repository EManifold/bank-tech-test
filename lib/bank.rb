class Bank
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    if valid?(amount)
      @balance += amount
    else
      raise 'Please enter a valid number amount'
    end
  end

  def withdraw(amount)
    @balance -= amount
  end

  private

  def valid?(amount)
    (amount.is_a? Integer) && amount.positive?
  end
end
