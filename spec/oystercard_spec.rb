require 'oystercard'

# In order to use public transport
# As a customer
# I want money on my card

# In order to keep using public transport
# As a customer
# I want to add money to my card

# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

describe Oystercard do

it "new card has default balance of £0" do
  expect(subject.balance).to eq (0)
end

it "adds money to card" do
  subject.top_up(10)
  expect(subject.balance).to eq (10)
end

it "raises error if balance is over max limit" do
  subject.top_up(Oystercard::MAX_LIMIT)
  expect{ subject.top_up(1) }.to raise_error "Max limit is £#{Oystercard::MAX_LIMIT}"
end

it "deducts money from the card" do
  subject.top_up(10)
  subject.deduct(3)
  expect(subject.balance).to eq (7)
end

it "returns in journey when touched in" do
  allow(subject).to receive (:balance) {Oystercard::MIN_LIMIT}
  subject.touch_in
  expect(subject).to be_in_journey
end

it "returns not in journey when touched out" do
  subject.touch_out
  expect(subject).not_to be_in_journey
end

it "retuns an error if balance is less than min limit" do
  expect{ subject.touch_in }.to raise_error "balance too low"
end

end
