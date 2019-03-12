require 'io/console' 
require 'rubygems'
require 'bundler/setup'

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

    # deposit action
    def deposit(amount)
        if check_value?(amount)
            @balance = @balance + amount
            return @balance
        end
    end

    # withdrawal action
    def withdrawal(amount)
        if check_value?(amount) && @balance > amount
            @balance -= amount
            return @balance
        end
    end
    
    # display the latest update to balance variable
    def show_balance()
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
    def menu(account)

        puts " ---------- CURRENT BALANCE ---------------- "
        account.show_balance()
        puts 
        puts
        command = "" 
        while command != "q"
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
                account.deposit(amount)
                STDIN.getch
                print "            \r" # extra space to overwrite in case next sentence is short.           
                account.show_balance()
                STDIN.getch
                print "            \r" # extra space to overwrite in case next sentence is short.           
            when "w"
                puts "You have chosen Withdrawal."
                puts "How much would you like to withdraw:"
                amount = gets.chomp.to_i
                account.withdrawal(amount)
                account.show_balance()
            when "b"
                puts "You have chosen to see your balance."
                account.show_balance()
            when "q"
                break
            else
                error
            end
        end

    end

    def error
        puts "Invalid Input! Please try again."
        STDIN.getch
        print "            \r" # extra space to overwrite in case next sentence is short.   
    end
end

# checks the user input pin and name against the stored combination in login.txt
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
        person ={}
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
            person = {name: check[0], pin: check[1], balance: check[2].to_i}
            return person
        else
            puts "Invalid log in. Good-bye!"
        end
    end
end

# Main Switchboadr for progressing through the program
def start
    validator = PinValidator.new()
    person = validator.check_pin
    my_account = Account.new(person[:name], person[:pin], person[:balance])
    userinput1 = UserInput.new()
    userinput1.menu(my_account)
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