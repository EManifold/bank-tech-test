require 'account'

describe Account do

  describe '#deposit' do
    it "should return the increased balance when inputting 500" do
      expect(subject.deposit(500)).to eq 500
    end

    it "should account for multiple deposits" do
      subject.deposit(500)
      expect(subject.deposit(400)).to eq 900.00
    end

    it "should return an error if the deposit amount is not a valid positive number" do
      expect { subject.deposit('M') }.to raise_error 'Please enter a valid number amount'
    end
  end

  describe '#withdraw' do
    it "should return the decreased balance when withdrawing 300" do
      subject.deposit(500)
      expect(subject.withdraw(300)).to eq 200
    end

    it "should return an error if the withdrawal amount is not a valid postive number" do
      expect { subject.withdraw('M') }.to raise_error 'Please enter a valid number amount'
    end

    it "should return an error if the withdrawal amount would go below 0" do
      expect { subject.withdraw(100) }.to raise_error 'You do not have enough funds to withdraw that amount'
    end
  end
end
