class Ticket < ApplicationRecord
  has_many :employeetickets
  has_many :employees, through: :employeetickets

  def self.sort_by_age
    Ticket.where(open: true).order(age: :desc)
  end
end
