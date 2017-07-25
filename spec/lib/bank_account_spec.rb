require "spec_helper"

RSpec.describe BankAccount do
  let(:bank_account) { bank_account = BankAccount.new(5406327, 1000.00) }


  describe ".new" do
    it "takes an account number and a deposit amount as arguments" do
      bank_account = BankAccount.new(5406327, 1000.00)
      expect(bank_account).to be_a(BankAccount)
    end
  end

  describe "#account_number" do
    it "returns the account number" do
      expect(bank_account.account_number).to eq(5406327)
    end
  end

  describe "#initial_desposit" do
    it "returns the initial deposit" do
      expect(bank_account.initial_desposit).to eq(1000.0)
    end
  end

  describe "#add_transaction" do
    it "stores the transaction in an array" do
      bank_account.add_transaction(-5.49)
      expect(bank_account.transactions).to include(-5.49)
    end
  end

  describe "#current_balance" do
    it "calculates the current balance" do
      bank_account.add_transaction(-5)
      bank_account.add_transaction(-10)
      bank_account.add_transaction(-20)
      expect(bank_account.current_balance).to eq(965)
    end
  end

  describe "#summary" do
    it "returns a text sumary of the account" do
      bank_account.add_transaction(-5)
      bank_account.add_transaction(-10)
      bank_account.add_transaction(-20)

      summary = bank_account.summary
      expect(summary).to include("Account Number: 5406327")
      expect(summary).to include("Initial Deposit: $1000.00")
      expect(summary).to include("$-5.00")
      expect(summary).to include("Current Balance: $965.00")
    end
  end

end
