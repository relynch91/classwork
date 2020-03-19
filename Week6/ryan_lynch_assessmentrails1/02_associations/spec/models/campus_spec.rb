require 'rails_helper'

RSpec.describe Campus, type: :model do
  subject(:mountain_view) { Campus.find_by_name("Mountain View") }

  it "is led by a campus manager" do
    expect(mountain_view.campus_manager.lname).to eq("Brin")
  end

  it "has employees working there" do
    jim = Employee.find_by_fname("Jim")
    kevin = Employee.find_by_fname("Kevin")
    larry = Employee.find_by_fname("Larry")
    michael = Employee.find_by_fname("Michael")
    pam = Employee.find_by_fname("Pam")
    expect(mountain_view.employees.order(:fname))
      .to eq([jim, kevin, larry, michael, pam])
  end

  it "is part of a company" do
    expect(mountain_view.company.name).to eq("Google")
  end
end
