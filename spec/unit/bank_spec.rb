require 'bank'

describe Bank do

  describe '#deposit' do
    it "should increase the balance by 500 when you deposit 500" do
      subject.deposit(500)
      expect(subject.balance).to eq 500
    end
  end
end
