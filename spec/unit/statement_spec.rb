require 'statement'
require 'timecop'

describe Statement do
  let(:transaction) { double :transaction }

  describe '#print_all' do
    it "should take in a transaction log and print it" do
      Timecop.freeze do
        allow(transaction).to receive(:log) { [[Time.now.to_s[0...10], "500.00", '', "500.00"],
                                             [Time.now.to_s[0...10], "300.00", '', "800.00"]]
                              }
        statement = Statement.new(transaction)
        expect(statement.print_all).to eq "date || credit || debit || balance/n"\
        "#{Time.now.to_s[0...10]} || 300.00 || || 800.00/n"\
        "#{Time.now.to_s[0...10]} || 500.00 || || 500.00"
      end
    end
  end
end
