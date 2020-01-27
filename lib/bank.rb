class Bank
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    raise 'Please enter a valid number amount' unless valid?(amount)

    @balance += amount
  end

  def withdraw(amount)
    raise 'Please enter a valid number amount' unless valid?(amount)
    
    @balance -= amount
  end

  private

  def valid?(amount)
    (amount.is_a? Integer) && amount.positive?
  end
end
