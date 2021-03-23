class BankAccount

    attr_accessor :bank_account, :balance, :status
    attr_reader :name

    def initialize(name, balance = 1000, status = "open")
        @bank_account = bank_account
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(money)
        @balance += money
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        @balance > 0 && @status == "open"
    end

    def close_account
        @status = "closed"
    end


end
