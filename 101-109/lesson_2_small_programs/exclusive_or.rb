=begin
PEDAC
- Problem undestanding
write a function named xor that takes two arguments, and returns true if
exactly one of its arguments is truthy, false otherwise. Note that we are looking
for a boolean result instead of a truthy/falsy value as returned by || and &&

- problem domain: thruthy(everything is trurhy in ruby except nil and false)
- explicit:
  -input: 2 boolean arguments
  -output: boolean

rule: if exactly ONLY ONE of its arguments should be truthy
=end

def xor?(boolean1, boolean2)
  boolean1 && !boolean2 || boolean2 && !boolean1 ? true : false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
