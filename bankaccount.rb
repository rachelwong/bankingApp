balance = Array.new
history = Array.new

def bal(balance)
    puts "your balance is $#{balance.sum}"
    puts welcome(balance, history)
end

def his(balance, history)
    puts "This is your history"
    puts history
    puts bal(balance, history)
end

def dep(balance, history)
    puts "How much would you like to deposit"
    input = ' '
    input = gets.chomp.to_i
    puts "You are depositing$#{input}"
    balance.push input
    history << input
    puts bal(balance, history)
end

def withd (balance, history)
    puts "How much would you like to withdraw?"
    input = ' '
    input = gets.comp.to_i
    if balance.sum < input
        puts error
    else
        puts "You have chosen to withdraw $#{input}"
        balance.push -input
        history << -inputputs 
        puts bal(balance, history)
    end
end

def exit
    puts "Thank you for banking with us!"
end

def error
    puts "Error! Invalid selection, please try again."
end

def clear
    system("clear")
end

def welcome(balance)
    puts "Welcome to the banking app, please enter 'b' for balance or 'e' for exit:"
    response = gets.chomp.downcase
    case response
        when "b"
            bal(balance, history)
        when "w"
            withd(balance, history)
        when "e"
            exit
        when "h"
            his(balance, history)
        when "d"
            dep(balance, history)
        else
            clear
            error
            welcome(balance, history)
    end
end

puts welcome(balance)





