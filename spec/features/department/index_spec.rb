require "rails_helper"

RSpec.describe 'department index page' do
  before :each do
    @department_1 = Department.create!(name: "IT", floor: "Basement")
    @department_2 = Department.create!(name: "Accountant", floor: "Mid")
    @department_3 = Department.create!(name: "Sales", floor: "Top")
    @employee_1 = @department_1.employees.create!(name: "Christina Aguilera", level: 2)
    @employee_2 = @department_2.employees.create!(name: "Brad pitt", level: 3)
    @employee_2 = @department_3.employees.create!(name: "Angelina Jolie", level: 3)
    @ticket_1 = Ticket.create!(subject: "printers broken", age: 5, open: true)

  end

  it "department's name and floor" do
    visit "/departments"
    expect(page).to have_content("Department's name and floor")
    expect(page).to have_content("Department: #{@department_1.name}")
    expect(page).to have_content("Floor: #{@department_1.floor}")
    expect(page).to have_content("Department: #{@department_2.name}")
    expect(page).to have_content("Floor: #{@department_2.floor}")
    expect(page).to have_content("Department: #{@department_3.name}")
    expect(page).to have_content("Floor: #{@department_3.floor}")

  end

  it "underneath each department i can see the name of all of its employee" do
    visit "/departments"
    expect(page).to have_content(@employee_1.name)
    expect(page).to have_content(@employee_2.name)
    expect(page).to have_content(@employee_3.name)
  end
end
