require 'io/console' 
require 'rubygems'
require 'bundler/setup'

class Account
    attr_reader :pin, :name
    attr_accessor :balance

    # creates new account 
    def initialize(name, pin=1234, balance)
        @name = name
        @pin = pin
        @balance = balance
        puts "Hi #{@name}, welcome to the banking app."
        puts "Press any key to continue."
        STDIN.getch
        print "            \r" # extra space to overwrite in case next sentence is short.   
        UserInput.new.menu(balance)
    end

    # deposit action
    def deposit(amount)
        if check_value?
            balance += amount
            return balance
        end
    end

    # withdrawal action
    def withdrawal(amount)
        if check_value? && balance > amount
            balance -= amount
            return balance
        end
    end
    
    # display the latest update to balance variable
    def show_balance(balance)
        puts "Your current balance is #{@balance}."
    end

    # checks user input amount is not negative
    def check_value?(amount)
        if amount > 0
            return true
        else
            UserInput.error
        end
    end
end

class UserInput
    def menu(balance)
        puts " ---------- YOUR BALANCE ---------------- "
        my_account.show_balance(balance)
        puts " --------------- MENU ------------------- "
        puts "What would you like to do?"
        puts "|| {D}eposit || {W}ithdrawal || {B}alance Update || {Q}uit ||"
        puts    
        command = gets.chomp.downcase.to_s
        
        case command
        when "d"
            puts "You have chosen Deposit."
            puts "How much would you like to deposit:"
            amount = gets.chomp.to_i
            my_account.deposit(amount)
        when "w"
            puts "You have chosen Withdrawal."
            puts "How much would you like to withdraw:"
            amount = gets.chomp.to_i
            my_account.withdrawal(amount)
        when "b"
            puts "You have chosen to see your balance."
            my_accounts.show_balance(balance)
        when "q"
            puts "Good bye!"
        else
            error
        end
    end

    def error
        puts "Invalid Input! Please try again."
        STDIN.getch
        print "            \r" # extra space to overwrite in case next sentence is short.   
        menu(balance)   
    end
end

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

        for line in File.open("login.txt")
            check = line.split(" ")
            # p check

            # Matt's idea
            if @name == check[0] && @pin == check[1] # check[1].to_i
                login = true
                break
            end
        end
        # Matt's idea
        if login == true
            puts "Log in successful."
            name = check[0]
            pin = check[1]
            balance = check[2].to_i
            my_account = Account.new(name, pin, balance)
            my_account.show_balance(balance)
        else
            puts "Invalid log in. Good-bye!"
        end
    end
end

# create a child class to account
class KidsAccount < Account
    attr_accessor :consent, :balance, :name
    attr_reader :pin

    def initialize(name, balance=100, pin, consent)
        @consent = consent
        super
    end

    def withdrawal
        super
    end

    def deposit
        super
    end

    def show_balance
        super
    end

    def get_constent
    end
end

def start
    validator = PinValidator.new()
    validator.check_pin
end

start