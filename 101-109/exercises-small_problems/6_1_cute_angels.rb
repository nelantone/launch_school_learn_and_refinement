=begin
Cute angles
Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:
=end
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°35'59") #%(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(0°00'00") # || dms(360) == %(360°00'00")

# Note: your results may differ slightly depending on how you round values,
# but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the
# minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:

=begin
PEDAC
input: float or integer
output: string with 1 to 3 digits as degrees, 2 digits as min, 2 digit as secs.

=end
# Further Exploration included:

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def exact_degrees(num_degree) # 360°
  remainder_num_degree = num_degree % 360
  %(#{remainder_num_degree}°00'00")
end

def dms(number)
  num_degree = number.to_i
  return exact_degrees(num_degree) if number == number.to_i # no min & sec reminders
  remain_min = (number.to_f % num_degree) * MINUTES_PER_DEGREE
  remain_sec = (remain_min % remain_min.to_i) * SECONDS_PER_MINUTE
  min_and_sec = format(%(%02d'%02d"), remain_min, remain_sec)
  "#{num_degree}#{DEGREE}#{min_and_sec}"
end

# I have a one-second deviation here 😄
dms(254.6) == %(254°35'59") # instead %(254°36'00")
# I used
dms(360) == %(0°00'00") # not dms(360) == %(360°00'00")
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")
