require 'transactions'
require 'timecop'

describe Transactions do

  describe '#deposit' do
    it "should create an array based on how much was deposited" do
      Timecop.freeze do
        subject.deposit(500, 900)
        expect(subject.log).to eq [[Time.now.strftime("%d/%m/%Y"), "500.00", '', "900.00"]]
      end
    end
  end
end
