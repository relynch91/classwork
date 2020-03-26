require 'rails_helper'

RSpec.describe Project, type: :model do
  subject(:search) { Project.find_by_title("Google Search") }

  it "is led by a project manager" do
    expect(search.project_manager.lname).to eq("Scott")
  end

  it "is developed at a company" do
    expect(search.company.name).to eq("Google")
  end

  describe "assignments" do
    let(:newbie) { Employee.create!(
      fname: "Newbie", campus_id: Campus.first.id
    ) }

    before(:each) do
      @new_assignment = ProjectAssignment.create!(
        programmer_id: newbie.id,
        project_id: search.id
      )
    end

    it "are associated with a project" do
      expect(search.assignments).to include(@new_assignment)
    end
  end

  it "has programmers working on it" do
    jim = Employee.find_by_fname("Jim")
    kevin = Employee.find_by_fname("Kevin")
    pam = Employee.find_by_fname("Pam")
    expect(search.programmers).to include(jim, kevin, pam)
  end
end
