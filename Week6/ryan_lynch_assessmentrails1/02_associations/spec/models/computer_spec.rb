require 'rails_helper'

RSpec.describe Computer, type: :model do
  it "is owned by an employee" do
    expect(Computer.first.owner.fname).to eq("Jim")
  end
end
