#!/usr/bin/env ruby

require_relative "../step7/expense_repository"
require_relative "../step7/expense_service"

repo = ExpenseRepository.new
service = ExpenseService.new(repo)

command = ARGV[0]

case command
when "list"
    expenses = service.list
    expenses.each do |x|
        puts "[#{x.id}] #{x.date} #{x.category} #{x.amount}円 (#{x.memo})"
    end
else
    puts ""
    exit 1
end