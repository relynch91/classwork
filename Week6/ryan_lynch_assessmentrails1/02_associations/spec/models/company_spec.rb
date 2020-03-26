require 'rails_helper'

RSpec.describe Company, type: :model do
  subject(:google) { Company.find_by_name("Google") }

  it "has employees" do
    jim = Employee.find_by_fname("Jim")
    kevin = Employee.find_by_fname("Kevin")
    pam = Employee.find_by_fname("Pam")
    larry = Employee.find_by_fname("Larry")
    expect(google.employees).to include(jim, kevin, pam, larry)
  end

  it "is run by a CEO" do
    expect(google.ceo.lname).to eq("Page")
  end

end
