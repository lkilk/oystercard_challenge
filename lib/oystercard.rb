class Oystercard
  attr_reader :balance, :entry_station, :journeys
  
  MAX_LIMIT = 90
  MIN_LIMIT = 1

  def initialize
    @balance = 0
    @max_limit = MAX_LIMIT
    @entry_station 
    @journeys = {}
  end

  def top_up(money)
    fail "Max limit is £#{MAX_LIMIT}" if @balance + money > MAX_LIMIT

    @balance += money
  end

  def touch_in(entry_station)
    fail "balance too low" if balance < MIN_LIMIT
    @entry_station = entry_station
    @journeys.merge!(entry_station: entry_station)
  end

  def touch_out(exit_station)
    deduct(MIN_LIMIT)
    @entry_station = nil
    @journeys.merge!(exit_station: exit_station)
  end

  def in_journey?
   !!@entry_station
   # @entry_station == nil ? false : true
  end

# Why do we still have this here if its an attr_reader?
  # def journeys
    # @journeys
  # end
  
  private

  def deduct(money)
    @balance -= money
  end

end
