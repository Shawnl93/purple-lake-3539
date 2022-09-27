require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it { should have_many(:employeetickets)}
    it { should have_many(:tickets).through(:employeetickets)}

    describe ' class method do ' do
        before :each do
          @department_1 = Department.create!(name: "IT", floor: "Basement")
          @department_2 = Department.create!(name: "Accountant", floor: "Mid")
          @department_3 = Department.create!(name: "Sales", floor: "Top")
          @employee_1 = @department_1.employees.create!(name: "Christina Aguilera", level: 2)
          @employee_2 = @department_2.employees.create!(name: "Brad pitt", level: 3)
          @employee_3 = @department_3.employees.create!(name: "Angelina Jolie", level: 3)
          @ticket_1 = Ticket.create!(subject: "printers broken", age: 5, open: true)
          @ticket_2 = Ticket.create!(subject: "computer broken", age: 1, open: true)
          @ticket_3 = Ticket.create!(subject: "mouse broken", age: 2, open: false)
          @employee_ticket_1 = Employeeticket.create!(employee: @employee_1, ticket: @ticket_1)
          @employee_ticket_2 = Employeeticket.create!(employee: @employee_1, ticket: @ticket_2)
          @employee_ticket_3 = Employeeticket.create!(employee: @employee_1, ticket: @ticket_3)
      end

      describe 'sort by age' do
        it 'can sort open ticket by age oldest to youngest' do
          expect(@employee_1.sort_by_age).to eq([@ticket_1, @ticket_2])
        end
      end
    end
  end
end
