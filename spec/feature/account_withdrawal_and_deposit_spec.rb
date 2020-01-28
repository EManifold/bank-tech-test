describe 'Account' do
  let(:transactions_test) { Transactions.new }
  let(:account_test) { Account.new(0, transactions_test) }
  let(:statement_test) { Statement.new(transactions_test) }

  it "depositing 500 should return a balance of 500" do
    expect(account_test.deposit(500)).to eq 500
  end

  it "depositing 400 then withdrawing 200 should give you a balance of 200" do
    account_test.deposit(400)
    account_test.withdraw(200)
    expect(account_test.balance).to eq 200
  end

  it "depositing a number below zero will return an error" do
    expect { account_test.deposit(-3) }.to raise_error 'Please enter a valid number amount'
  end

  it "depositing not a number will return an error" do
    expect { account_test.deposit('M') }.to raise_error 'Please enter a valid number amount'
  end

  it "withdrawing more than your available balance will raise an error" do
    account_test.deposit(100)
    expect { account_test.withdraw(200) }.to raise_error 'You do not have enough funds to withdraw that amount'
  end
end