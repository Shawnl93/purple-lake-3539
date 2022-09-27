class Employee < ApplicationRecord
  belongs_to :department
  has_many :employeetickets
  has_many :tickets, through: :employeetickets

  def sort_by_age
    self.tickets.where(open: true).order(age: :desc)
  end
end
