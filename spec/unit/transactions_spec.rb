require 'transactions'
require 'timecop'

describe Transactions do

  describe '#deposit' do
    it "should add the transaction to the log if one deposit is made" do
      Timecop.freeze do
        subject.entry(500, 900, :credit)
        expect(subject.log).to eq [[Time.now.strftime("%d/%m/%Y"), "500.00", '', "900.00"]]
      end
    end

    it "should add the transaction to the log if multiple deposits and transactions are made" do
      Timecop.freeze do
        subject.entry(500, 900, :credit)
        subject.entry(300, 600, :debit)
        expect(subject.log).to eq [[Time.now.strftime("%d/%m/%Y"), "500.00", '', "900.00"], [Time.now.strftime("%d/%m/%Y"), '', "300.00", "600.00"]]
      end
    end
  end
end
