def welcome(balance)
    puts "Welcome to the banking app, please enter 'b' for balance or 'e' for exit:"
    response = gets.chomp.downcase
          case response
              when "b"
                 bal(balance)
              when "e"
                 exit
              else
                 clear
                 error
                 welcome(balance)
          end
end

puts welcome(balance)

balance = array.new
history = Array.new

def his(balance, history)
    puts "This is your history"
    puts history
    puts bal(balance, history)
    end

def bal(balance)
    puts "your balance is $#{balance.sum}"
    puts welcome(balance)
end

def dep(balance, history)
    puts "How much would you like to deposit"
    input = ' '
    input = gets.chomp.to_i
    puts "you are depositing$#{input}"
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
    puts "you have chosen to withdraw $#{input}"
    balance.push -input
    history << -inputputs bal(balance, history)
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