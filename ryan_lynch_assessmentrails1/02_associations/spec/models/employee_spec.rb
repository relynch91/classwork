require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject(:jim) { Employee.find_by_fname("Jim") }

  it "works at a campus" do
    expect(jim.campus.name).to eq("Mountain View")
  end

  it "works for a company" do
    expect(jim.company.name).to eq("Google")
  end

  it "reports to one campus manager" do
    expect(jim.campus_manager.lname).to eq("Brin")
  end

  it "has a computer" do
    expect(jim.computer.model).to eq("MacBook Air")
  end

  describe "Programmer" do
    subject(:jim) { Employee.find_by_fname("Jim") }

    let!(:dwight) do
      Employee.create!(
        fname: "Dwight",
        lname: "Schrute",
        campus_id: Campus.find_by_name("New York").id
      )
    end

    let!(:gmail) do
      Project.create!(
        project_manager_id: dwight.id,
        title: "Gmail",
        description: "An awesome email app"
      )
    end

    let!(:gmaps) do
      Project.create!(
        project_manager_id: dwight.id,
        title: "GMaps",
        description: "High quality map app"
      )
    end

    let!(:gmail_assignment) do
      ProjectAssignment.create!(
        project_id: gmail.id,
        programmer_id: jim.id
      )
    end

    let!(:gmaps_assignment) do
      ProjectAssignment.create!(
        project_id: gmaps.id,
        programmer_id: jim.id
      )
    end

    it "has project assignments" do
      expect(jim.project_assignments).to include(gmail_assignment)
    end

    it "can work on many projects" do
      expect(jim.projects).to include(gmail).and include(gmaps)
    end

    it "works with project managers" do
      expect(jim.project_managers).to include(dwight)
    end
  end

  describe "Project Manager" do
    subject(:michael) {Employee.find_by_fname("Michael")}

    it "leads projects" do
      search = Project.find_by_title("Google Search")
      expect(michael.projects_led).to include(search)
    end

    it "manages programmers" do
      jim = Employee.find_by_fname("Jim")
      kevin = Employee.find_by_fname("Kevin")
      pam = Employee.find_by_fname("Pam")
      expect(michael.programmers).to include(jim, kevin, pam)
    end
  end

  describe "Campus Manager" do
    subject(:sergey) {Employee.find_by_fname("Sergey")}

    it "directs a campus" do
      mountain_view = Campus.find_by_name("Mountain View")
      expect(sergey.managed_campus).to eq(mountain_view)
    end
  end
end
