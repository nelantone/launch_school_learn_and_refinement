# John and Mary want to travel between a few towns A, B, C ... Mary has on a sheet of paper a list of distances between these towns. ls = [50, 55, 57, 58, 60]. John is tired of driving and he says to Mary that he doesn't want to drive more than t = 174 miles and he will visit only 3 towns.

# Which distances, hence which towns, they will choose so that the sum of the distances is the biggest possible to please Mary and John?

# Example:
# With list ls and 3 towns to visit they can make a choice between: [50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60].

# The sums of distances are then: 162, 163, 165, 165, 167, 168, 170, 172, 173, 175.

# The biggest possible sum taking a limit of 174 into account is then 173 and the distances of the 3 corresponding towns is [55, 58, 60].

# The function choose_best_sum will take as parameters t (maximum sum of distances), k (number of towns to visit) and ls (list of distances, all distances are positive or zero integers and this list has at least one element). The function returns the "best" sum ie the biggest possible sum of k distances less than or equal to the given limit t, if that sum exists, or otherwise nil.



# LONG
=begin
* Problem understanding:
  - Mental model:
    - given the max miles, towns and distances that Jhon want to drive return the max miles he migtht want to do visiting 3 towns. 

  - Input: integers and array(town mileS)

  - Output: integer in  miles

  - Rules:
    - Explicit:
      - John only want to go to 3 towns
      - there is a miles limit
      - there is a towns limit

    - Implicit:
      - if there are not enough twons(in this case3) we don't consider a sum, then we return nil

  - Questions:

* Examples:

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    + init result_sum
    +find all possible combinations of max number of towns (3 in these examples) town/miles
    + find the sum from each combination
    - select only the possible miles(less orr equal than the max miles)
    - select the greatest sum

  - Ideas:

  - Apporach:
      - based on the max num towns and and mile towns collection find out all possible combinations
      - from the combinations we want to sum each of them and filter hte possible ones(equal or less than the max_miles)
      - return the max sum


  - Higher Level Algorithm(helper methods):


* Code:
=end
def choose_best_sum(max_miles, max_towns, town_miles_ary)
  result_sum= []
  
  town_miles_ary.combination(max_towns) { |combo_miles| result_sum << combo_miles.sum }


  result_sum.select {|sum| sum <= max_miles}.max
end



# ts = [50, 55, 56, 57, 58]
# p choose_best_sum(163, 3, ts) == 163

xs = [50] 
p choose_best_sum(163, 3, xs) #== nil 

# ys = [91, 74, 73, 85, 73, 81, 87] 
# p choose_best_sum(230, 3, ys) == 228