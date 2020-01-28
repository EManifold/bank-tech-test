class Statement

  def initialize(transactions = Transactions.new)
    @transactions = transactions
  end

  def header
    "date || credit || debit || balance"
  end

  def print_all
    raise "You have no transactions to view" unless @transactions.log[0]

    puts header
    @transactions.log.reverse.map do |transaction|
      puts transaction.join(' || ').gsub("||  ||", "|| ||")
    end
  end
end
