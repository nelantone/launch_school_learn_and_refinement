# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given
# by an argument. You may assume that the year is greater than 1752 (when the
# United Kingdom adopted the modern Gregorian Calendar) and that it will remain
# in use for the foreseeable future.

=begin
- Problem understanding:
  - mental model: return the number of fridays in the input year.
  - input: year as integer
  - output: integer
  - rules:
    - explicit:
      - year is greater than 1752 (using Gregorian Calendar also in future)
    - implicit:/
- Examples(below)
- Data scructure:
- Algorithm:
  understand time method
  intialize Time.new(year, 1, 13).friday?
   for each month ask if it was friday. In case is `yes` add +1
- Code:
=end
require 'date'

# Examples:
def friday_13th(year)
  (1..12).count { |month| Date.new(year, month, 13).friday? }
end

def days_per_month_collection(year)
  (1..12).map do |month|
    month == 12 ? 31 : (Date.new(year, month + 1) - Date.new(year, month)).to_i
  end
end

def five_fridays_in_month(year)
  count = 0

  days_per_month_collection(year).each_with_index do |days, month|
    fri_month = 0

    1.upto(days) { |day| fri_month += 1 if Date.new(year, month + 1, day).friday? }

    count += 1 if fri_month == 5
  end

  count
end
five_fridays_in_month(2021) == 5
five_fridays_in_month(2022) == 4

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
