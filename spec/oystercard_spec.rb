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

describe Oystercard do

it "new card has default balance of £0" do
  expect(subject.balance).to eq (0)
end

it "adds money to card" do
  subject.top_up(10)
  expect(subject.balance).to eq (10)
end

it "raises error if balance is over £90" do
  subject.top_up(Oystercard::MAX_LIMIT)
  expect { subject.top_up(1) }.to raise_error "Max limit is £#{Oystercard::MAX_LIMIT}"
end


end
