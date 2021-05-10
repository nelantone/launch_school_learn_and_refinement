# A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.

# He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).

# His mother looks out of a window 1.5 meters from the ground.

# How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?

# Three conditions must be met for a valid experiment:
# Float parameter "h" in meters must be greater than 0
# Float parameter "bounce" must be greater than 0 and less than 1
# Float parameter "window" must be less than h.
# If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

# Note:
# The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

# Examples:
# - h = 3, bounce = 0.66, window = 1.5, result is 3

# - h = 3, bounce = 1, window = 1.5, result is -1

# (Condition 2) not fulfilled).

=begin
* Problem understanding:
  - Mental model:
    - calculate the times the ball is seen from a window taking in count.
      - height
      - bounce of the ball
      - meters from the gourn to the window

  - Input:
    - integers and/or floats: height, bounce, window(height from floor to the window)

  - Output:
    - integers

  - Rules:
    - Explicit:
      Three conditions
      - height(h) > 0
      - 1 > bounce(b) > 0
      - window(w) < height(h)
    - Implicit:

  - Questions:

* Examples:
    - example
      - ball bounces 0.66 ( two-thirds of its height )
      - 3 / 0.66  3 * (2/3)
      - mother 1.5 mtr

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - find if the conditions are not fullfilled
      - if height(h) < 0,
           bounce(b) < 0,
           bounce(b) > 1,
           window(w) > height(h)
            then return -1
      - otherwise
        - initialize `total` variable
        - multiply height per bounce until is smaller than the window.
        - every time we iterate count 1 time
          - the iteration needs to break and then we take the total
          the total should be  twice*
          * as we count when goes up and down
          ** the total needs to be -1 because the first time we only see the
          ball going down and not up.

* Code:
=end
# (((3*0.66)*(0.66))*0.66)
def bouncing_ball(height, bounce, window)
  return -1 if height < 0 || bounce >= 1 || bounce <= 0 || window > height

  total = 0
  updated_height = height # to don't mutate the argument

  until updated_height < window
    updated_height *= bounce
    total += 1
  end
  (total * 2) - 1
end

bouncing_ball(3, 0.66, 1.5) == 3
bouncing_ball(30, 0.66, 1.5) == 15 # 16.5
bouncing_ball(30, 0.75, 1.5) == 21
bouncing_ball(30, 0.4, 10) == 3
bouncing_ball(3, 1, 1.5) == -1


# do it again! +1h!