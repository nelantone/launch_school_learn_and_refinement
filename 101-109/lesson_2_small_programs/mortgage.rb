=begin
input:
- loan amount
- Annual percentage rate
- loan duration(months)

output:
- monthly interest rate
- loan duration in months
- monthly payment

formula
m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

month_paym = loan_amount * (month_int_r / (1 - (1 + month_int_r)**(-loan_dur)))

I want to know how much I will pay every month for my loan.
From the loan amount I asked depends from the month interest
rate from the total exponencially related to the loan duration

=end

def prompt(text)
  Kernel.puts(">> #{text}")
end

Kernel.puts("== Welcome to the mortgage calculator == \n\n".upcase)
prompt("Please Add your currency name")
currency= Kernel.gets().chomp()
prompt("Add the loan ammount")
loan_amount = Kernel.gets().chomp().to_f
prompt("Add the annual percentage rate")
annual_percent_rate = Kernel.gets().chomp().to_f
prompt("Add your loan duration in months")
loan_duration_months = Kernel.gets().chomp().to_i
prompt("This is your information:")
prompt("\n================================\n
Your loan ammount: #{loan_amount} #{currency}\n
your percent rate is #{annual_percent_rate}% \n
your loan duration #{loan_duration_months} in months \n
loan duration in years #{loan_duration_months / 12} \n
================================")

# loan_amount

annual_rate = annual_percent_rate / 100

month_int_rate = annual_rate / 12

def month_int_ratio_share(month_int_rate, loan_duration_months)
  (month_int_rate / (1 - (1 + month_int_rate)**(-loan_duration_months)))
end

def month_paym(loan_amount, month_int_rate, loan_duration_months)
  loan_amount * month_int_ratio_share(month_int_rate, loan_duration_months)
end

monthly_payment = month_paym(loan_amount, month_int_rate, loan_duration_months)

prompt("These are your results:")
prompt("\n================================\n
Monthly payment:
#{monthly_payment.round(2)} #{currency}\n
Total debt:
#{(monthly_payment * loan_duration_months).round(2)} #{currency}\n
Only interests debt:
#{((monthly_payment * loan_duration_months) - loan_amount).round(2)} #{currency}


================================")
