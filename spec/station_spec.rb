require 'station.rb'

describe Station do

  #** I want to know what zone a station is in
  subject { described_class.new(name: 'Old Street', zone: 4) }
  it 'assigns an argument to the name' do
    expect(subject.name).to eq('Old Street')
  end
  it 'assigns an argument to the zone' do
    expect(subject.zone).to eq(4)
  end

  
end