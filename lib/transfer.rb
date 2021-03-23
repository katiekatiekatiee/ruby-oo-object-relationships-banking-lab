require "pry"

class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid?
    self.receiver.valid?
  end

  def execute_transaction

    if !@sender.valid? || !@receiver.valid? || self.status == "complete" || @sender.balance < @amount 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."

   

    else
      @receiver.deposit(amount)
      @sender.balance -= @amount
      self.status = "complete"
      
    
    end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
