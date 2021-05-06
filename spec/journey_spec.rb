require 'journey.rb'

describe Journey do

it 'defaults entry stationto nil' do
  journey = Journey.new
  expect(journey.entry_station).to eq nil
end

it 'returns itself' do
  journey = Journey.new('Kings Cross')
  expect(journey.entry_station).to eq 'Kings Cross'
end

it 'completes the journey' do
  journey = Journey.new('Kings Cross')
  expect(journey.complete).to eq false
end


end