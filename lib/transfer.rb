class Transfer
  # your code here
  
   attr_accessor :status, :bankaccount
   attr_reader :amount, :sender, :receiver
  
  def initialize (sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
def valid?
    sender.valid? && receiver.valid?
  end
  
    def execute_transaction
      if @status != "complete"
        if self.valid? && self.amount < sender.balance
        receiver.balance += @amount
        sender.balance -= @amount
        @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
        end
      end
    end
  
end
