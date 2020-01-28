class Transactions
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount, balance)
    @log << [Time.now.to_s[0...10], sprintf('%.2f', amount), '', sprintf('%.2f', balance)]
  end

  def withdraw(amount, balance)
    @log << [Time.now.to_s[0...10], '', sprintf('%.2f', amount), sprintf('%.2f', balance)]
  end

end
