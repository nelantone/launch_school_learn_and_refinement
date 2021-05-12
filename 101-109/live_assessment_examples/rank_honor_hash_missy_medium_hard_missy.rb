=begin
Complete the method that takes a hash of users, and find the nexus: the user whose rank is the closest or equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the lowest rank (numeric value). The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

Example
             rank honor
    users =  { 1 => 93,
              10 => 55,
              15 => 30,
              20 => 19, <--- nexus
              23 => 11,
              30 => 2 }
=end

=begin
* Problem understanding:
  - Mental model:
    - Return the rank of this whose rank is the closest or equal to his honor. Otherwise return the closest if there are many closests  return the one with the lowest rank

  - Input: hash

  - Output: integer

  - Rules:
    - Explicit:
      - return the eql number of the h-rank
      - otherwise find the closest h-r
      - in case there are many smallest number

    - Implicit:
      - all are positive

  - Questions:

* Examples:
  - key -> rank 1,3,5
    value -> honor 3,3,1
    return rank -> 3
  - nobody has an exact rank/honor match,
    {1 => 10, 2 => 6, 3 => 4, 5 => 1}
    hon  -> 1,2,3,5
    rank -> 10,6,4,1
    because 3 is the honor and 4 rank is the closest to the honour we will return 3(the honour).
    1 => 10, 2 => 3, 3 => 4, 5 => 1
    2h -> 3rank
    3h -> 4rank
     we return 2 as honor as the smallest number.
* Data Structure:
    - ary?

* Algorithm:
  - Main Algorithm:
    + return `k` when k && v are the same
    + in case there are many find the min number difference
    + when there are not the same find the smallest range
    - substract the difference, in case honour is greater than rank do the opposite substraction
      - in there many find the min difference (range size)
         and an return the honour of the minimum difference.

  - Higher Level Algorithm(helper methods):

* Code:
=end

def nexus(hsh)
  closest_min_reslut = []
  hon_sz_range       = {}

  hsh.each do |honour, rank|
    if honour == rank
      return honour
    else
      hon_sz_range[honour] =  honour < rank ? rank - honour : honour - rank

      closest_min_reslut = hon_sz_range.min_by {|_, sz_range| sz_range}.first
    end
  end
  closest_min_reslut
end


p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2

# **  do again the problem