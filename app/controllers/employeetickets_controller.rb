class EmployeeticketsController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    ticket = Ticket.find(params[:ticket_id])
    Employeeticket.create(ticket: ticket, employee: employee)
    redirect_to employee_path(employee)

    # Employeeticket.create(ticket_id: params[:ticket_id], employee_id: params[:employee_id])
  end
end
