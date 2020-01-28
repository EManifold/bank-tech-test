class Statement

  def initialize(transactions = Transactions.new)
    @transactions = transactions
  end

  def header
    "date || credit || debit || balance/n"
  end

  def print_all
    statement = @transactions.log.reverse.map do |transaction|
      transaction.join(' || ')
    end
    (header + statement.join("/n")).gsub("||  ||", "|| ||")
  end
end
