# initiliase balance and history which will store an cumulative tracking of changes 
balance = Array.new
history = Array.new

# Display current balance
def balance(balance)
    puts "your balance is $#{balance.sum}"
    puts welcome(balance, history)
end

# Display balance history 
def show_history(balance, history)
    puts "This is your history"
    puts history
    puts balance(balance, history)
end

# Deposit method with no error handling
def deposit(balance, history)
    puts "How much would you like to deposit"
    input = ' '
    input = gets.chomp.to_i
    puts "You are depositing $#{input}"
    balance.push input
    history << input
    puts balance(balance, history)
end

# Withdrawal method as long as enough balance to withdraw
def withdraw (balance, history)
    puts "How much would you like to withdraw?"
    input = ' '
    input = gets.chomp.to_i
    if balance.sum < input
        puts error
    else
        puts "You have chosen to withdraw $#{input}"
        balance.push -input
        history << -input 
        puts balance(balance, history)
    end
end

# Output exit message
def exit
    puts "Thank you for banking with us!"
end

# Output error message
def error
    puts "Error! Invalid selection, please try again."
end

# Clear screen
def clear
    system("clear")
end

# Welcome screen and switchboard logic handling user input to menu 
def welcome(balance)
    puts "Welcome to the banking app, please enter 'b' for balance or 'e' for exit:"
    response = gets.chomp.downcase
    case response
        when "b"
            balance(balance, history)
        when "w"
            withdraw(balance, history)
        when "e"
            exit
        when "h"
            show_history(balance, history)
        when "d"
            deposit(balance, history)
        else
            clear
            error
            welcome(balance, history)
    end
end

# initiate program
puts welcome(balance)