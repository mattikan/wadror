require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "works with style and name set" do
    beer = Beer.create name:"beer", style:"Weizen"
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end

  it "doesn't save nameless beers" do
    beer = Beer.create style:"Weizen"
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "doesn't save beers without style" do
    beer = Beer.create name:"beer"
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
end
