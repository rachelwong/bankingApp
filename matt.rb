# Matt Stubbs' explanation of the ruby app in class 

class Account
  attr_reader :name
  attr_reader :pin
  attr_accessor :balance

  def initialize(name = "Untitled", balance = 100, pin = 1234)
    @name = name
    @balance =balance
    @pin = pin
    puts "Account created"
  end

  def desposit_funds(amount)
    # Check the amount >0 
  end

  def withdrawl_funds(amount)
    # Check account_balance is > 0
    # Amount > 0
    # Amount < account_balance
  end

end

# This is a child of Account
class KidsAccount < Account
  attr_reader :parent_or_guardians_name

  def initialize(name, balance, pin, parent_or_guardians_name)
    @parent_or_guardians_name = parent_or_guardians_name
    super
  end

  def desposit_funds(amount)
    # check the parent has given permission
    # Check the amount > 0
  end

  def validate_parent_signature()

  end

end
-
end

class Statement
  attr_accessor :account
  def print(account)
    @account = account
    # gets the name and the blance and prints it out nicely
  end
end

account = Account.new("John", 100, 9999)

statement_outputter = Statement.new()
statement_outputter.print(account)


class PDFStatemnt < Statement
  def print(account)
    super
    # generates a pdf
  end
end

class PinValidator
  def method(account, users_pin)
    # Check the account is not using the default pin
    account.pin == users_pin
  end
end

class UserInput
  # handles user input
  def menu(user_input)
    case "3" # find account
      find_account(input)
    case "4" # withdrawl
      account.withdrawl_funds(amount)

    end
  end

  def find_account(account_name)

  end
end