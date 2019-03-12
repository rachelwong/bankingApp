require 'io/console' 
require 'rubygems'
require 'bundler/setup'

# Account object that handles the three options of withdrawal, deposit, display balance
# Includes error-handlign check_value 
class Account
    attr_reader :pin, :name
    attr_accessor :balance

    # creates new account 
    def initialize(name, pin, balance)
        @name = name
        @pin = pin
        @balance = balance
        puts "Hi #{@name}, welcome to the banking app."
        puts "Press any key to continue."
        STDIN.getch
        print "            \r" # extra space to overwrite in case next sentence is short.   
    end

    # Deposit action
    def deposit(amount)

        # If the user input amount is not negative
        if check_value?(amount)

            # Increment & update the balance with the user input amount
            @balance = @balance + amount
            return @balance
        end
    end

    # Withdrawal action
    def withdrawal(amount)

        # if the user input amount is not negative AND they are not withdrawing more than the balance 
        if check_value?(amount) && @balance >= amount

            # Reduce the balance by user input amount
            @balance = @balance - amount
            return @balance

        # catch-all for overdrawn and non-integer input 
        else
            puts "Invalid Amount! Please try again."
            STDIN.getch
            print "            \r" # extra space to overwrite in case next sentence is short.   
        end
    end
    
    # Display the latest updated balance
    def show_balance
        system("clear")
        puts
        puts " ---------- CURRENT BALANCE ---------------- "
        puts "Your current balance is #{@balance}."
        puts
    end

    # Checks user input amount is not negative
    def check_value?(amount)
        if amount > 0
            return true
        end
    end
end

# UserInput object handling menu display and error screen
class UserInput

    # Menu switchboard
    def menu(account)
        system{"clear"}
        account.show_balance() # always display balance before menu prompt
        puts 
        puts
        command = "" 
        while command != "q"
            puts " --------------- MENU ------------------- "
            puts "What would you like to do?"
            puts "|| {D}eposit || {W}ithdrawal || {B}alance Update || {Q}uit ||"
            puts   
            command = gets.chomp.downcase.to_s
            # Menu switchboard
            case command
            when "d" # Deposit action
                puts "You have chosen Deposit."
                puts "How much would you like to deposit:"
                amount = gets.chomp.to_i
                system("clear")
                account.deposit(amount)
                account.show_balance()
            when "w" # Withdrawal action
                puts "You have chosen Withdrawal."
                puts "How much would you like to withdraw:"
                amount = gets.chomp.to_i
                system("clear")
                account.withdrawal(amount)
                account.show_balance()
            when "b" # Display balance
                puts "You have chosen to see your balance."
                account.show_balance()
            when "q" # Quit
                break
            else # Error catch-all for other string/numeri input 
                error
            end
        end
    end

    # Error screen
    def error
        puts "Invalid Input! Please try again."
        STDIN.getch
        print "            \r" # extra space to overwrite in case next sentence is short.   
    end
end

# Checks the user input pin and name against the stored combination in login.txt
class PinValidator
    attr_reader :pin
    attr_accessor :name

    def check_pin
        puts "What is your name?"
        @name = gets.chomp.downcase.to_s

        puts "What is your pin?"
        @pin = gets.chomp # this is not an int because it is made into an array of strings

        # Matt's idea
        login = false
        person = {}

        # Checks everyline in the data source login.txt to authenticate user input 
        for line in File.open("login.txt")
            # Convert each line in data source into an array
            check = line.split(" ")
            # p check
            # Matt's idea
            # if the user name and pin input matches data source
            if @name == check[0] && @pin == check[1] # check[1].to_i
                login = true
                break
            end
        end

        # Matt's idea
        # if login successful, initiate person hash
        if login == true
            puts "Log in successful."
            person = {name: check[0], pin: check[1], balance: check[2].to_i}
            return person
        else
            puts "Invalid log in. Good-bye!"
            return false # it needs to completely leave the program here 
        end
    end
end

# Triger to start the program
def start
    validator = PinValidator.new() # Validates the pin first
    person = validator.check_pin # Creates validated person instance, receives person detail hash to initiate account
    my_account = Account.new(person[:name], person[:pin], person[:balance]) # initate person object using person hash
    userinput1 = UserInput.new() # initialise userinput object to start the menu 
    userinput1.menu(my_account) # trigger menu
end

# Trigger program to start
start

# create a child class to account
# class KidsAccount < Account
#     attr_accessor :consent, :balance, :name
#     attr_reader :pin

#     def initialize(name, balance=100, pin, consent)
#         @consent = consent
#         super
#     end

#     def withdrawal
#         super
#     end

#     def deposit
#         super
#     end

#     def show_balance
#         super
#     end

#     def get_constent
#     end
# end