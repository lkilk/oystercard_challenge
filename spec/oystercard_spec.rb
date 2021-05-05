require 'oystercard'

describe Oystercard do
let(:entry_station) { double :station }
let(:exit_station) { double :station }

it "new card has default balance of £0" do
  expect(subject.balance).to eq (0)
end

# I want to add money to my card
it "adds money to card" do
  subject.top_up(10)
  expect(subject.balance).to eq (10)
end

# I want a maximum limit (of £90) on my card
it "raises error if balance is over max limit" do
  subject.top_up(Oystercard::MAX_LIMIT)
  expect{ subject.top_up(1) }.to raise_error "Max limit is £#{Oystercard::MAX_LIMIT}"
end

# I need to touch in and out
it "returns in journey when touched in" do
  allow(subject).to receive (:balance) {Oystercard::MIN_LIMIT}
  subject.touch_in(entry_station)
  expect(subject).to be_in_journey
end

it "returns not in journey when touched out" do
  subject.touch_out(exit_station)
  expect(subject).not_to be_in_journey
end

# I need to have the minimum amount for a single journey
it "retuns an error if balance is less than min limit" do
  expect{ subject.touch_in(entry_station) }.to raise_error "balance too low"
end

# I need my fare deducted from my card
it "deducts minimum balance when touched out" do
  subject.top_up(10)
  expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MIN_LIMIT)
end

it "has an empty list of journeys by default" do
  expect(subject.journeys).to be_empty
end

# I want to see to all my previous trips
let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
it "allows us to view previous journeys" do
  subject.top_up(10)
  subject.touch_in(entry_station)
  subject.touch_out(exit_station)
  expect(subject.journeys).to include journey
end

end
