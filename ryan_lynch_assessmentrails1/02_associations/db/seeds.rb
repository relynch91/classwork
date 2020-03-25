ActiveRecord::Base.transaction do
  puts 'Beginning to seed'

  Campus.destroy_all
  Employee.destroy_all
  Company.destroy_all
  Project.destroy_all
  ProjectAssignment.destroy_all
  Computer.destroy_all

  # campuses
  Campus.new(
    name: "Mountain View",
    address: "1600 Amphitheatre Parkway"
  ).save!(validate: false)
  mountain_view = Campus.last

  new_york = Campus.new(
    name: "New York",
    address: "76 Ninth Avenue",
  ).save!(validate: false)
  new_york = Campus.last

  # managers
  larry = Employee.create!(
    fname: "Larry",
    lname: "Page",
    campus_id: mountain_view.id
  )

  michael = Employee.create!(
    fname: "Michael",
    lname: "Scott",
    campus_id: mountain_view.id
  )

  sergey = Employee.create!(
    fname: "Sergey",
    lname: "Brin",
    campus_id: new_york.id
  )

  # company
  google = Company.create!(
    name: "Google",
    ceo_id: larry.id
  )

  mountain_view.update!(
    campus_manager_id: sergey.id,
    company_id: google.id
  )
  new_york.update!(
    campus_manager_id: michael.id,
    company_id: google.id
  )

  # programmers
  oscar = Employee.create!(
    fname: "Oscar",
    lname: "Martinez",
    campus_id: new_york.id
  )

  jim = Employee.create!(
    fname: "Jim",
    lname: "Halpert",
    campus_id: mountain_view.id
  )

  kevin = Employee.create!(
    fname: "Kevin",
    lname: "Malone",
    campus_id: mountain_view.id
  )

  pam = Employee.create!(
    fname: "Pam",
    lname: "Beesly",
    campus_id: mountain_view.id
  )

  # projects
  search = Project.create!(
    project_manager_id: michael.id,
    title: "Google Search",
    description: "Find anything instantly"
  )

  # assignments
  ProjectAssignment.create!(project_id: search.id, programmer_id: jim.id)
  ProjectAssignment.create!(project_id: search.id, programmer_id: kevin.id)
  ProjectAssignment.create!(project_id: search.id, programmer_id: pam.id)

  # computers
  Computer.create!(model: "MacBook Air", owner_id: jim.id)
  Computer.create!(model: "MacBook Pro", owner_id: larry.id)
end
