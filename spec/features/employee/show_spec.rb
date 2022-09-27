require "rails_helper"

RSpec.describe 'employee show page' do
  before :each do
    @department_1 = Department.create!(name: "IT", floor: "Basement")
    @department_2 = Department.create!(name: "Accountant", floor: "Mid")
    @department_3 = Department.create!(name: "Sales", floor: "Top")
    @employee_1 = @department_1.employees.create!(name: "Christina Aguilera", level: 2)
    @employee_2 = @department_2.employees.create!(name: "Brad pitt", level: 3)
    @employee_3 = @department_3.employees.create!(name: "Angelina Jolie", level: 3)
    @ticket_1 = Ticket.create!(subject: "printers broken", age: 5, open: true)

  end

  it "sees employee's name and department name" do
    visit "/employees/#{@employee_1.id}"
    expect(page).to have_content("Name: #{@employee_1.name}")
    expect(page).to have_content("Department: #{@department_1.name}")
  end

end
