=begin

5 kyu

In this kata, you will write a function that returns the positions and the values of the "peaks" (or local maxima) of a numeric array.

For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with a value of 5 (since arr[3] equals 5).

The output will be returned as an object with two properties: pos and peaks. Both of these properties should be arrays. If there is no peak in the given array, then the output should be {pos: [], peaks: []}.

Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should return {pos: [3, 7], peaks: [6, 3]} (or equivalent in other languages)

All input arrays will be valid integer arrays (although it could still be empty), so you won't need to validate the input.

The first and last elements of the array will not be considered as peaks (in the context of a mathematical function, we don't know what is after and before and therefore, we don't know if it is a peak or not).

Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3] and [1, 2, 2, 2, 2] do not. In case of a plateau-peak, please only return the position and value of the beginning of the plateau. For example: pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} (or equivalent in other languages)

Have fun!

Examples:

pick_peaks([1,2,3,6,4,1,2,3,2,1]) ==  {"pos"=>[3,7], "peaks"=>[6,3]}
                  |       |
pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
                  |       |
pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
                  |       |     |<-(plateau)
pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
                |   |<= plateau
pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}
                |   ?... we don't know if it's a pleateau

=end


=begin
* Problem understanding:
  - Problem domain:
    - peak: top of the wave(need to increment to max point and decrease)
  - Mental model:
    - find the position(value indexes) and peack(value numbers) in an array of numbers 

  - Input: array

  - Output: hash

  - Rules:
    - Explicit:
      - output will be returned as an object with two properties: pos and peaks
      - All input arrays will be valid integer arrays(no validation)
      - first and last elements of the array will not be considered as peaks
      - plateau-peak only return the position and value of the beginning of the plateau:
        pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]}
    - Implicit:
      - if the plateau is partial (we don't know if is it. Doun't count it.
        - [1, 2, 2, 2, 2] do not
        - [1, 2, 2, 2, 3] valid(as plateau not as pick)
  - Questions:

* Examples:

* Data Structure:
    - array?

* Algorithm:
  - Main Algorithm:
    - find the peack of a collection of numbers
      - we want ot find out if the next element is greater than the one before.
    - find the index of the peak
    - find peaks and indexes
    - if there is a peak in the begining/end ignore it
    - ignore the next decreasing nums

  - Ideas:
    - find out when the element starts to decrease(this is the pick)
    - find guard clauses(specidfic cases)

  - Methods to use:
    - Basic methods:

    - Direct methods:

  - Apporach:

  - Higher Level Algorithm(helper methods):
    - find_peack

* Code:
=end

def is_plateau?(num, idx , arr, current_plateau)
  numbers_dont_increase = num == arr[idx+1] && (arr[idx+1] == arr[idx+2])
  last_element_decease  = arr[-1] < arr[-2]

  numbers_dont_increase && last_element_decease  && current_plateau.empty?
end

def find_peaks(arr)
  result       = { "pos" => [], "peaks" => [], }
  current_peak = []

  arr.each_with_index do |num, idx|
    unless idx + 1 == arr.size || idx == 0
      unless arr[idx+1] == arr[idx+2] # plateau candidate
        if num > arr[idx+1] && current_peak.empty?
          current_peak << num
          result['peaks'] << num
          result['pos'] << idx
        elsif current_peak && num < arr[idx+1]
          current_peak = [] # restart peak
        end
      end
    end
  end
  result
end

def find_plateaus(arr, result)
  current_plateau = []
  arr.each_with_index do |num, idx|
    unless idx + 1 == arr.size || idx == 0
      if  is_plateau?(num, idx , arr, current_plateau)
        current_plateau << num
        result['peaks'] << num
        result['pos'] << idx
      end
    end
  end
  result
end

def pick_peaks(arr)
  result = find_peaks(arr)
  find_plateaus(arr, result)
end

p find_peaks([1,2,3,6,4]) == { "peaks"=> [6], "pos" => [3]}
p find_peaks([1,2,3,6,4,1,2,3,2,1]) == {"pos"=>[3,7], "peaks"=>[6,3]}
# #                  3 4?    7 8
p pick_peaks([1,2,3,6,4,1,2,3,2,1]) ==  {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]} # peak in the end
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]} # plateau(2)
p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]} #plateau(4)
p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]} # continuos plateau(we don't know if goes.