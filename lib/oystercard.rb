class Oystercard
  attr_reader :balance
  MAX_LIMIT = 90
  MIN_LIMIT = 1

  def initialize
    @balance = 0
    @max_limit = MAX_LIMIT
    @in_journey = false
  end

  def top_up(money)
    fail "Max limit is £#{MAX_LIMIT}" if @balance + money > MAX_LIMIT

    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    fail "balance too low" if balance < MIN_LIMIT

    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end


end
