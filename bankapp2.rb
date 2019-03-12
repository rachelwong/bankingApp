class Account
    attr_reader :name
    attr_accessor :balance

    # creates new account object
    def initialize(name, balance = 100)
        @name = name
        @balance = balance
        puts "Hi #{@name}, your account has been created."    
    end

    # switchboard logic to direct to account actions
    def menu(balance)
        puts "What do you want to do?"
        puts "|| {B}alance update || {D}eposit || {W}ithdraw ||"
        puts

        input = gets.chomp.to_s
        case input
            when "b"
                balance_display(bqalance)
            when "d"
                deposit(balance)
            when "w"
                withdraw(balance)
            # if none of the options are chosen, restart from the beginning
            else
                error
                welcome(balance)
            end
        end
    end

    # display current balance action
    def balance_display(balance)
        puts "Your current balance is $#{@balance}."
    end

    # withdraw action
    def withdrawal(balance)

        # if the amount is not negative & there is sufficient balance 
        if value_check(amount) == false && balance > amount
            balance = balance - amount
            return balance
        end
        menu(balance)
    end

    # deposit action
    def deposit(balance)
        if value_check(amount) == false
            balance = balance + amount
            return balance
        end
        menu(balance)
    end

    # check amounts is not negative
    def value_check(amount)
        # if 
        if amount < 0
            error
        else
            return false
        end
    end

    # welcome screen
    def welcome(name, balance)
        puts "Welcome to the Ruby banking application, #{@name}."
        clear
        menu(balance)
    end

    # error screen
    def error
        clear
        puts "INVALID INPUT!"
    end
    
    # clear screen 
    def clear
        system("clear")
    end

end