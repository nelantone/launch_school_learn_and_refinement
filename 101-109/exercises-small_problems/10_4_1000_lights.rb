# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n. Each switch
# is connected to exactly one light that is initially off. You walk down the
# row of switches and toggle every one of them. You go back to the beginning,
# and on this second pass, you toggle switches 2, 4, 6, and so on. On the
# third pass, you go back again to the beginning and toggle switches 3, 6, 9,
# and so on. You repeat this process and keep going until you have been
# through n repetitions.

# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.

=begin
Problem understanding:
bank of switchess all off first
first round turn on all lights
second-r off pair lights (2,4 off),
thir-r switch multiple of 3 (2, 3, 4 off, 1 and 5 on)
fourth-r switch % 4 == 0 (2, 3  off, 4, 1, 5 on)
fifth-r switch when % 5 == 0 (2, 3, 5 off, 1, 4 off)
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

input: number
output: string with number info
rules:
  -`n` times iteration
  - implicit rule: each round will be switching the lights by the multiple number

Examples(below)

Data structure:
hash?

Algorithm:
- (first round) start a n lights_on array all are `true`
- we will do an iteration of n times
- every new round we have n multiple to toggle the light on/off(true/false)

Code

=end

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

def lights_on_alternations(total_lights)
  lights_alternation = []
  total_lights.times { lights_alternation << true }

  (2).upto(total_lights) do |round|
    lights_alternation.map!.with_index(1) do |light, idx|
      idx % round == 0 ? !light : light
    end
  end

  lights_alternation
end

def total_lights_on(total_lights)
  total_alternation = lights_on_alternations(total_lights)
  lights_on = []

  total_alternation.each_with_index do |light_on, idx|
    lights_on << idx + 1 if light_on
  end

  print "The result is that #{lights_on.size} lights are left on, lights "
  print "#{lights_on[0..-2].join(', ')} and #{lights_on[-1]}."
  print "The return value is "

  lights_on
end

total_lights_on(5)
total_lights_on(1000)

# Further exploration ########################################

def lights_on_alternations(total_lights)
  lights_alternation = []
  total_lights.times { lights_alternation << true }
  all_rounds = [lights_alternation]

  (2).upto(total_lights) do |round|
    lights_alternation = lights_alternation.clone

    lights_alternation.map!.with_index(1) do |light, idx|
      idx % round == 0 ? !light : light
    end

    all_rounds << lights_alternation
  end

  all_rounds
end

def total_lights_on_and_rounds(number_of_lights)
  total_alternation = lights_on_alternations(number_of_lights)

  on = []
  total_alternation.size.times do |round|
    on = []
    off = []

    total_alternation[round].each_with_index do |light_on, idx|
      if light_on
        on << idx + 1
      else
        off << idx + 1
      end
    end

    if round == 0
      puts 'round 1: every light is turned on'
    else
      puts ''
      print "round #{round + 1}: lights #{off[0..-2].join(', ')} "
      print "and #{off[-1]} are now off; #{on[0..-2].join(', ')} "
      print "and #{on[-1]} are on"
      puts ''
    end

    if (round + 1) == total_alternation.size
      puts ''
      print "The result is that #{on.size} lights are left on, lights "
      print "#{on[0..-2].join(', ')} and #{on[-1]}. The return value is"
    end
  end
  on
end

total_lights_on_and_rounds(5)
########
