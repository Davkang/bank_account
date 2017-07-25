
class BankAccount
  attr_reader :account_number, :initial_desposit, :transactions


  def initialize(account_number, initial_desposit)
    @account_number = account_number
    @initial_desposit = initial_desposit
    @transactions = []
  end

  def add_transaction(amount)
    @transactions << amount
  end

  def current_balance
    result = initial_desposit
    @transactions.each do |transaction|
      result += transaction
    end
    result
  end

  def summary
    pretty_deposit = sprintf('%.2f', initial_desposit)

    result = "Account Number: #{account_number}\n"
    result += "Initial Deposit: $#{pretty(initial_desposit)}\n"
    result += "Transacdtions:\n"

    transactions.each do |transaction|
      pretty_transaction = sprintf('%.2f', transaction)
      result += "   $#{pretty(transaction)}"
    end

    pretty_balance = sprintf('%.2f', current_balance)
    result += "Current Balance: $#{pretty(current_balance)}"
    result
  end

  private
  def pretty(amount)
    sprintf('%.2f', amount)
  end


end
