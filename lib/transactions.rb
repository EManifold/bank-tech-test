class Transactions
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount, balance)
    @log << [Time.now.strftime("%d/%m/%Y"), sprintf('%.2f', amount), '', sprintf('%.2f', balance)]
  end

  def withdraw(amount, balance)
    @log << [Time.now.strftime("%d/%m/%Y"), '', sprintf('%.2f', amount), sprintf('%.2f', balance)]
  end

end
