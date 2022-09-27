require "rails_helper"

RSpec.describe 'department index page' do
  before :each do
    @department_1 = Department.create!(name: "IT", floor: "Basement")
    @department_2 = Department.create!(name: "Accountant", floor: "Mid")
    @department_3 = Department.create!(name: "Sales", floor: "Top")
    @employee_1 = @department_1.employees.create!(name: "Christina Aguilera", level: 2)
    @ticket_1 = Ticket.create!(subject: "printers broken", age: 5, open: true)

  end

  it "department's name and floor" do
    visit "/departments"
    expect(page).to have_content(@department_1.name)
    expect(page).to have_content(@department_1.floor)
    expect(page).to have_content(@department_2.name)
    expect(page).to have_content(@department_2.floor)
    expect(page).to have_content(@department_3.name)
    expect(page).to have_content(@department_3.floor)
  end
end
