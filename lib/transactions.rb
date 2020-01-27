class Transactions
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount, balance)
    @log << { date: Time.now.to_s[0...10], credit: amount, debit: 0, balance: balance }
  end

  def withdraw(amount, balance)
    @log << { date: Time.now.to_s[0...10], credit: 0, debit: amount, balance: balance }
  end

end
