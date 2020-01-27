require 'account'

describe Account do

  # let(:date) { Time.now.to_s[0...10] }
  let(:transaction) { double :transaction }


  describe '#deposit' do
    it "should increase the balance by 500 when you deposit 500" do
      subject.deposit(500)
      expect(subject.balance).to eq 500.00
    end

    it "should account for multiple deposits" do
      subject.deposit(500)
      subject.deposit(400)
      expect(subject.balance).to eq 900.00
    end

    it "should return an error if the deposit amount is not a valid positive number" do
      expect { subject.deposit('M') }.to raise_error 'Please enter a valid number amount'
    end

    # it "should return a hash of all the transaction values with a deposit" do
    #   amount = 500
    #   balance = 500
    #   allow(transaction).to receive(:deposit) do |amount, balance|
    #     [{date: date, credit: amount, debit: 0, balance: balance}]
    #   end
    #   expect(subject.deposit(amount)).to eq transaction.deposit(amount, balance)
    # end
  end

  describe '#withdraw' do
    it "should decrease the balance by 300 when you deposit 300" do
      subject.deposit(500)
      subject.withdraw(300)
      expect(subject.balance).to eq 200.00
    end

    it "should account for multiple deposits and withdrawals" do
      subject.deposit(500)
      subject.withdraw(100)
      subject.withdraw(100)
      expect(subject.balance).to eq 300.00
    end

    it "should return an error if the withdrawal amount is not a valid postive number" do
      expect { subject.withdraw('M') }.to raise_error 'Please enter a valid number amount'
    end

    # it "should return a hash of all the transaction values with a withdrawal" do
    #   account_double = double()
    #   allow(account_double).to receive(:balance).and_return(500)
    #   amount = 500
    #   balance = 500
    #   allow(transaction).to receive(:withdraw) do |amount, balance|
    #     [{date: date, credit: 0, debit: amount, balance: balance}]
    #   end
    #   expect(account_double.withdraw(amount)).to eq transaction.withdraw(amount, balance)
    # end

    it "should return an error if the withdrawal amount would go below 0" do
      expect { subject.withdraw(100) }.to raise_error 'You do not have enough funds to withdraw that amount'
    end
  end
end
