class Oystercard
  attr_reader :balance
  MAX_LIMIT = 90

  def initialize
    @balance = 0
    @max_limit = MAX_LIMIT
  end

  def top_up(money)
    fail "Max limit is £#{MAX_LIMIT}" if @balance + money > MAX_LIMIT

    @balance += money
  end


end
