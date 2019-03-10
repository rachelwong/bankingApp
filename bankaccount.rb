class Account
    attr_reader :name, :pin
    attr_accessor: :balance

    def initialize (name, balance, pin)
        @name = name
        @balance = balance
        @pin = pin
    end

    def pin_error
end

account1 = Account.new("Rachel", 1000, 1234)

