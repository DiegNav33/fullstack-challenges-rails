require_relative 'bank_account'

# puts new_bank = BankAccount.new("Diego","FR14-2004-1010-0505-0001-3M02-606", 200, 1234)
# puts new_bank.deposit(300)
# puts new_bank.transactions_history({password: 1234})
# puts new_bank.withdraw(200)
# puts new_bank.transactions_history({password: 1234})

puts new_bank2 = BankAccount.new("Melissa","FR14-2004-2020-0505-1010-3M02-809", 10_320, 0000)
puts new_bank2.deposit(12)
puts new_bank2.transactions_history({password: 0000})
puts new_bank2.withdraw(11)
puts new_bank2.transactions_history({password: 0000})
