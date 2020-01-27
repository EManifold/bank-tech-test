require 'bank'

describe Bank do

  describe '#deposit' do
    it "should increase the balance by 500 when you deposit 500" do
      subject.deposit(500)
      expect(subject.balance).to eq 500
    end

    it "should account for multiple deposits" do
      subject.deposit(500)
      subject.deposit(400)
      expect(subject.balance).to eq 900
    end
  end

  describe '#withdraw' do
    it "should decrease the balance by 300 when you deposit 300" do
      subject.deposit(500)
      subject.withdraw(300)
      expect(subject.balance).to eq 200
    end

    it "should account for multiple deposits and withdrawals" do
      subject.deposit(500)
      subject.withdraw(100)
      subject.withdraw(100)
      expect(subject.balance).to eq 300
    end
  end
end
