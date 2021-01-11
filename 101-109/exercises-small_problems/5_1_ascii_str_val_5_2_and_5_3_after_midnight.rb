# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument.
# The ASCII string value is the sum of the ASCII values of every character in the string.
# (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(string)
  string.sum
end

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

# After Midnight (Part 1)
# The time of day can be represented as the number of minutes before or after midnight.
# If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.
# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# Examples:

# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# Disregard Daylight Savings and Standard Time and other complications.

=begin
PEDAC
input: integer(negative or positive meaning minutes)
output: string as clock numbers in 24hrs
rules:
- If the number of minutes is positive, the time is after midnight.
- If the number of minutes is negative, the time is before midnight.

Algorithm/Data structure
- we need to calculate how many min are in a day. 24 * 60.0 = 1440
- in case the number of min is bigger than 1440 we want remove the days and keep the hour
  We will do it with limiting the minutes in the day.
- when the minutes are smaller than 1440
We check is positive or negative

when  is positive count is forward, when is negative backwards.

when is 0 is 00:00 hr

for counting the time we need to find first the hours inside the minutes.
string/60 min.
the residual part are the minutes inside the hour we have.

- for positive numbers + hours + min to the clock
- for negative numbers - hours - min to the clock

once we have the hour and minutes we convert them and add them to a string.

Code

=end
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def format_two_digits(time_measure_str)
  time_measure_str.prepend('0') if ('0'..'9').include?(time_measure_str)
  time_measure_str
end

def time_of_day(minutes_integer)
  integer_in_hours = minutes_integer / MINUTES_PER_HOUR
  hh_reminder_str = ((integer_in_hours) % HOURS_PER_DAY).to_s
  mm_reminder_str = (minutes_integer % MINUTES_PER_HOUR).to_s

  hh = format_two_digits(hh_reminder_str)
  mm = format_two_digits(mm_reminder_str)

  "#{hh}:#{mm}"
end

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

# After Midnight (Part 2)
# As seen in the previous exercise, the time of day can be represented as
# the number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative, the
# time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# PEDAC
# input: string as clock numbers in 24hrs
# outputs: integer(positive meaning minutes)
# rules:
# - If the number of minutes is positive, the time is after midnight.
# - If the number of minutes is negative, the time is before midnight.

# Algorithm/Data structure
# - we need to calculate how many min are in a day. 24 * 60.0 = 1440
# - in case the number of min is bigger than 1440 we want remove the days and keep the hour
#   We will do it with limiting the minutes in the day.
# - when the minutes are smaller than 1440
# We check is positive or negative
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(hh_mm_str)
  hours, minutes = hh_mm_str.split(':').map(&:to_i)
  hours_in_minutes = (hours * MINUTES_PER_HOUR)
  total_minutes = minutes + hours_in_minutes
  total_minutes % MINUTES_PER_DAY
end

def before_midnight(hh_mm_str)
  (MINUTES_PER_DAY - after_midnight(hh_mm_str)) % MINUTES_PER_DAY
end

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
before_midnight('48:00') == 0
before_midnight('25:00') == (1440-60)
