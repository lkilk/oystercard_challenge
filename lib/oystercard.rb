class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys
  MAX_LIMIT = 90
  MIN_LIMIT = 1

  def initialize
    @balance = 0
    @max_limit = MAX_LIMIT
    @entry_station 
    @journeys = []
  end

  def top_up(money)
    fail "Max limit is £#{MAX_LIMIT}" if @balance + money > MAX_LIMIT

    @balance += money
  end

  def touch_in(station)
    fail "balance too low" if balance < MIN_LIMIT
    @entry_station = station
    @journeys << station
  end

  def touch_out
    deduct(MIN_LIMIT)
    @entry_station = nil
  end

  def in_journey?
   !!@entry_station
  end

  def journeys
    @journeys
  end
  
  private

  def deduct(money)
    @balance -= money
  end

end
