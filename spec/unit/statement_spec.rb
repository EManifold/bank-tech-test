require 'statement'
require 'timecop'

describe Statement do
  let(:transaction) { double :transaction }

  describe '#print_all' do
    it "should take in a transaction log and print it" do
      Timecop.freeze do
        date = Time.now.strftime("%d/%m/%Y")
        allow(transaction).to receive(:log) { [[date, "500.00", '', "500.00"],
                                             [date, "300.00", '', "800.00"]]
                              }
        statement = Statement.new(transaction)
        expect { statement.print_all }.to output("date || credit || debit || balance\n"\
        "#{date} || 300.00 || || 800.00\n"\
        "#{date} || 500.00 || || 500.00\n").to_stdout
      end
    end

    it "should return an error if there are no transactions to print" do
      allow(transaction).to receive(:log) { [] }
      statement = Statement.new(transaction)
      expect { statement.print_all }.to raise_error "You have no transactions to view"
    end
  end
end
