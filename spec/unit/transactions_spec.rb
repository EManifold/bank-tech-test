require 'transactions'

describe Transactions do

  let(:date) { Time.now.to_s[0...10] }

  describe '#deposit' do
    it "should create a hash based on how much was deposited" do
      subject.deposit(500, 900)
      expect(subject.log).to eq [{
        date: date,
        credit: 500,
        debit: 0,
        balance: 900 }]
    end
  end
end
