# frozen_string_literal: true

# Oystercard generator class
class Oystercard
  attr_reader :balance, :entry_station, :journeys

  MAX_LIMIT = 90
  MIN_LIMIT = 1

  def initialize
    @balance = 0
    @max_limit = MAX_LIMIT
    @journeys = {}
  end

  def top_up(money)
    raise "Max limit is £#{MAX_LIMIT}" if @balance + money > MAX_LIMIT

    @balance += money
  end

  def touch_in(entry_station)
    raise 'balance too low' if balance < MIN_LIMIT

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

  private

  def deduct(money)
    @balance -= money
  end
end


