require 'pry'
class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else false
    end
  end

  def execute_transaction
   # binding.pry
    if @status == "pending" && @sender.valid? && @receiver.valid? && @sender.balance > @amount
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    @status = "complete"
    else 
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
   # binding.pry
    end
  end
  def reverse_transfer
    # binding.pry
     if @status == "complete" && @sender.valid? && @receiver.valid? && @sender.balance > @amount
     @sender.balance = @sender.balance + @amount
     @receiver.balance = @receiver.balance - @amount
     @status = "reversed"
     else 
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
    # binding.pry
     end
   end


end

    # it "can execute a successful transaction between two accounts" do
    #   transfer.execute_transaction
    #   expect(amanda.balance).to eq(950)
    #   expect(avi.balance).to eq(1050)
    #   expect(transfer.status).to eq("complete")