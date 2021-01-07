=begin
In the modern era under the Gregorian Calendar, leap years occur in every year
that is evenly divisible by 4, unless the year is also divisible by 100. If the
year is evenly divisible by 100, then it is not a leap year unless the year is
evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that
takes any year greater than 0 as input, and returns true if the year is a leap
year, or false if it is not a leap year.

PEDAC

* Problem understanding: /
- problem domain:  leap years(occur in every year
that is evenly divisible by 4 see "rules" for details)

- explicit
 - input: number greater than 0.
 - output: boolean (true/false)

- implicit in/out? /

 - mental model:
 /

 - rules:
  - leap years.
   -for any year greater than year 0
  - every year that is evenly divisible by 4.
  - Unnless the year is also divisible by 100. But it this year evenly
    divisible by 400 then it is a leap year.

 - clarifying questions: /

* Examples/test & edge cases (see below)

* Data structure:
conditional operators and filters as modulo operators/ regex expressions

* Algorithm:

- check if the  year should be divisible by 4. year %4.
 - in case is  not is false
- if is divisible by 4 it shouldn't be duvisible by 100 but in tn case it is
and it is also divisible by 400 it is also a leap year

* Code:

=end

def leap_year?(year)
  return false if year % 4 != 0
  if year % 100 == 0
    return false unless year % 400 == 0
  end
  true
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

=begin
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year.
Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap
years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to
determine leap years both before and after 1752.
=end

def leap_year?(year)
  return false if year % 4 != 0
  if year >= 1752 && year % 100 == 0
    return false unless year % 400 == 0
  end
  true
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
