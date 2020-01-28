class Statement

  def initialize(transactions = Transactions.new)
    @transactions = transactions
  end

  def header
    "date || credit || debit || balance/n"
  end

  def print_all
    raise "You have no transactions to view" unless @transactions.log[0]
    
    statement = @transactions.log.reverse.map do |transaction|
      transaction.join(' || ')
    end
    (header + statement.join("/n")).gsub("||  ||", "|| ||")
  end
end
