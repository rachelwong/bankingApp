require 'io/console' 
require 'rubygems'
require 'bundler/setup'

class Account
    attr_reader :pin, :name
    attr_accessor :balance

    # creates new account 
    def initialize(name, pin=1234, balance=100)
        @name = name
        @pin = pin
        @balance = balance
        puts "Hi #{@name}, welcome to the banking app."
        puts "Your account has been created."
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
        puts "What would you like to do?"
        puts "|| {D}eposit || {W}ithdrawal || {B}alance Update ||"
        puts    
        command = gets.chomp.downcase.to_s
        STDIN.getch
        print "            \r" # extra space to overwrite in case next sentence is short.      
        case command
        when "d"
            puts "You have chosen Deposit."
            puts "How much would you like to deposit:"
            amount = gets.chomp.to_i
            STDIN.getch
            print "            \r" # extra space to overwrite in case next sentence is short.          
            Account.deposit(amount)
        when "w"
            puts "You have chosen Withdrawal."
            puts "How much would you like to withdraw:"
            amount = gets.chomp.to_i
            STDIN.getch
            print "            \r" # extra space to overwrite in case next sentence is short.          
            Account.withdrawal(amount)
        when "b"
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

my_account = Account.new("Rachel", 1234, 200)