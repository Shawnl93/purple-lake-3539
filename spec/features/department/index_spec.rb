require "rails_helper"

RSpec.describe 'department index page' do
  before :each do
    @department_1 = Department.create!(name: "IT", floor: "Basement")
    @employee_1 = Employee.create!(name: "Christina Aguilera", level: 2)
    @ticket_1 = Ticket.create!(subject: "printers broken", age: 5, open: true)

  end

  it "shows employee's name and department name" do

  end
end
