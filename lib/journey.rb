class Journey

  attr_reader :entry_station
  attr_reader :complete
def initialize(entry_station=nil)
  @entry_station = entry_station
  @complete = false
end


end