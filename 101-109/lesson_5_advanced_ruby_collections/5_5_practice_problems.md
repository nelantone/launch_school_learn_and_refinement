### 5.5 Practice Problems: Sorting, Nested Collections and Working with Blocks

The purpose of these practice problems is to let you practice the specific concepts covered in the last three assignments

Remember to focus on the structure of the collection object, the return value of blocks and methods and the side effects of any methods.


#### Practice Problem 1

1. How would you order this array of number strings by descending numeric value?
2. How you solve this problem and sort the array in reverse order.

```ruby .numberLines
arr = ['10', '11', '9', '7', '8']
```

<details>
<summary>Answer</summary>

</br>
1.

```ruby .numberLines
# arr.sort will not work with each collection object as are string
# representation of integers, in this case are sorted in `asciibetical` order

arr.sort_by(&:to_i) # => ["7", "8", "9", "10", "11"]

#or

arr.sort {|str_num| str_num.to_i } # => ["7", "8", "9", "10", "11"]
```

***Original answer***

```ruby
arr.sort {|a,b| a.to_i <=> b.to_i }
```

2.
```ruby .numberLines
arr.sort_by(&:to_i).reverse

# or (original result)

arr.sort {|a,b| b.to_i <=> a.to_i }
```

</details>
</br>


#### Practice Problem 2
How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

```ruby .numberLines
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
```

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
books.sort_by {|hash| hash[:published].to_i }
# => [
# {:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"},
# {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"},
# {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"},
# {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}
# ]
```

***Original answer***
```ruby .numberLines
books.sort_by do |book|
  book[:published]
end
# => [
# {:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"},
# {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"},
# {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"},
# {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}
# ]
```

*We can use sort_by and access a particular value in each hash by which to sort, as long as those values have a `<=>` method.*

*In this case, all the values for `:published` are strings so we know that we can compare them. **Since all the values in question are four characters in length**, in this case **we can simply compare the strings without having to convert them to integers**.*

</details>
</br>


#### Practice Problem 3
For each of these collection objects demonstrate how you would reference the letter 'g'.

```ruby .numberLines
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
```

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
arr1[-1][-1][-1] # => 'g'

arr2[-1][:third][0] # => 'g'

arr3[-1][:third][0][0] # => 'g'

hsh1['b'][-1]  # => 'g'

hsh2[:third].keys[0]  # => 'g'
```

***Original answer***
```ruby .numberLines
arr1[2][1][3] # => "g"

arr2[1][:third][0] # => "g"

arr3[2][:third][0][0] # => "g"

hsh1['b'][1] # => "g"

hsh2[:third].key(0) # => "g"
```

*Note: the ***Hash#key*** method returns the key of an occurrence of a given value. A couple of things to note when using this method:*

* ***If more than one key has the same value the method returns the key for the first occurrence of that value.***
* ***If the requested value does not exist in the hash then nil is returned.***

*For this example you could also have done the following:*

```ruby
hsh2[:third].keys[0] # => 'g'
```

*Although this looks very similar to the initial solution, `Hash#key` and `Hash#keys` are actually two completely different methods. **`Hash#key`** returns a **single key based on a value passed to the method**. **`Hash#keys` returns an array of all the keys in the hash**, and the [0] is then referencing the object at index 0 of that returned array.*
</details>
</br>

#### Practice Problem 4
For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

```ruby .numberLines
arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

```

<details>
<summary>Answer</summary>

```ruby .numberLines
arr1[1][1]= 4 # arr1 => [1, [2, 4], 4]

arr2[-1]=4 # arr2 => {a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 4]

hsh1[:first][-1][0] = 4 # hsh1 => {first: [1, 2, [4]]}

hsh2[['a']][:a][-1] = 4 # hsh2 => {a: ['1', :two, 4], b: 4}, 'b' => 5}

```

***Original answer***

```ruby .numberLines
arr1[1][1] = 4
arr1 # => [1, [2, 4], 4]

arr2[2] = 4
arr2 # => [{:a=>1}, {:b=>2, :c=>[7, 6, 5], :d=>4}, 4]

hsh1[:first][2][0] = 4
hsh1 # => {:first=>[1, 2, [4]]}

hsh2[['a']][:a][2] = 4
hsh2 # => {["a"]=>{:a=>["1", :two, 4], :b=>4}, "b"=>5}
```

*In the last example the key for the first item in the outer hash is actually an array containing a single string object ["a"]. Although this is unusual, it is important to remember that both hash keys and values can be any Ruby object.*

</details>
</br>

#### Practice Problem 5
Given this nested Hash:

```ruby .numberLines
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```
figure out the total age of just the male members of the family.

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
male_munsters = munsters.values.select { |k, v| k["gender"] == 'male' }

male_musnters.map { |hsh| hsh['age'] }.sum # => 444
```

***Original answer***
```ruby .numberLines
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444
```
*In this example, within each key-value pair in the outer hash the value is itself a hash. When iterating through the outer hash, we need to access two values from each inner hash.*

*Since we're not referencing the key (each family member's name) from the key-value pairs in the outer hash, we can use Hash#each_value with a single block parameter.*

</details>
</br>



#### Practice Problem 6
One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

```ruby .numberLines
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```
...like this:

```ruby .numberLines
(Name) is a (age)-year-old (male or female).
```

<details>
<summary>Answer</summary>
</br>

```ruby .numberLines
=begin
Problem understanding:
- print name, age and gender of each fam membet
Example (Above)

Data-Struct/Algorithm:
nested hash as { name => { age => x, gender => y }}

we need to print `(Name) is a (age)-year-old (male or female).`

we will use #each for the nested hash iteration, where key is member name
and value is a nested hash with age and gender

Code:
=end

munsters.each do |name, details|
  puts "#{name} is a #{details['age']}-year-old #{details['gender']}."
end

```


***Original answer***
*same code of the solution* **

*In this case we need to access both the key (each family member's name) and the value (the inner hashes containing the details), so we need to use Hash#each_pair or Hash#each with two block parameters.*

</details>
</br>



#### Practice Problem 7 *
Given this code, what would be the final values of a and b? Try to work this out without running the code.

```ruby .numberLines
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
```

<details>
<summary>Answer</summary>

</br>
on `line 1 and 2` we initialize var `a` and `b` where `a` is assigned to an integer `2` and `b` to an array collection of two integers `5` and `8`.

on `line 3` we assign `arr` variable to a nested array pointing the variable `a` and `b` to the same objects in memory creating a nested array as `[2,[5,8]`

on `line 4` on `arr` we use the method `index at 0` to access `2` and we call on the same time the  `+=` reassinging the variable, this is equal to `arr[0] = arr[0] + 2`as arr[0] is `2`  the final result is `4`. As it is a reassingment at this point `a on line 1` will still `2` and `a on line 3` is reassigned to `4` and now are pointing to differnet objects.

on `line 5` we use on `arr` `index at [1]` who is `b` and on the same time
as nested array we use on `[5,8]` `index at [0]` to access integer `5` on the same time we have another reassigment, with the operator `-=` in explicit syntax `arr[1][0] = arr[1][0] - a` or `arr[1][0] = 5 - 2` as `a` is the initial `a`.
in this case the reassigment is inside an array, so the array is the same and `b` on `line 1`is still linked to `b` `on line 3`, we just reassigned a specific value inside the array and value of `b[0]` on line 1 will be rreasigned from `5` to `3`
Then the return values are:
```ruby
a # => 2
b # => [3, 8]
arr # => [4, [3, 8]]
```
How we can point initial `b` to a different point in memory?

In this case.

```ruby .numberLines
b = [5, 8]
arr = [2, b]
arr[1] += [1]
```
on `line 3` is the same as `arr[1] = [5, 8] + [1]` where` arr[1]` is`b` and `b`
reassigned.
In this case the return values are

```ruby
b # => [5,8]
arr # =>  [2. [5, 8, 1]]
```

In general, it is easier to see it as reassigment. Coming back to the initial example and just focusing on `b`

```ruby .numberLines
b = [2, 8]
arr = [a, b]

arr[1][0] = 4
```
on `line 4` step by step, first find on `arr at index 1` `b` as `[2, 8]` then we  we find on `b` `at index 0` `2` then we just reassign `2` to `4`
```ruby
b # => [4, 8]
arr # => [2, [4, 8]]
```

***Original answer***
```ruby .numberLines
a # => 2
b # => [3, 8]
```
*The value of **a didn't change** because we are not referencing a at any point. This code `arr[0] += 2` was modifying the array, arr not a. In effect **we are assigning a new object** at that index of the array so that instead of `arr[0]` containing a it now contains `4` - we can check this by looking at the value of arr:*

```ruby .numberLines
arr # => [4, [3, 8]]
```
*The value of **b did change because b is an array and we are modifying that array** by **assigning** a **`new value at index 0` of that array**.*

</details>

</br>

#### Practice Problem 8
Using the **each** method, write some code to output all of the vowels from the strings.

```ruby .numberLines
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
```


<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
# this is the straight forward solution with each method.
hsh.values.flatten.join.scan(/[a,e,i,o,u]/).each { |vowel| puts vowel } 
# using each method with less fancy methods.
vowels = 'aeiou'
hsh.values.flatten.join.chars.each do |char|
  puts char if vowels.include?(char)
end
# e
# u
# i
# o
# o
# u
# e
# o
# e
# e
# a
# o
```

***Original answer***

```ruby .numberLines
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
# e
# u
# i
# o
# o
# u
# e
# o
# e
# e
# a
# o
```

*The key here is to first iterate through the hash to access the values (the arrays) and then iterate through each array to access each string. At this point String#chars can be called within the block to return an array of characters for that string in that iteration, this array of characters can itself then be iterated through and puts called if on its iteration the character meets a condition (in this case that it is present in the vowels variable).*

*Note that we used each here, which means each iteration has an argument for a key and one for the value. Since we don't care about the key, we just use _ to signify that this is an argument that we aren't going to use. We could also have used Hash#values as well.*

</details>
</br>


#### Practice Problem 9
Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

```ruby .numberLines
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
```

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
=begin
- Problem understanding
  - input: array
  - output: array

  - mental model:
    Return new array with the same number/size/type collection
    (structure) but with the sub-arrays ordered(alphabet/numbers)
    in descending orders.

  rules:
  - explicit:
    - same structure
    - descending(greater to smaller)
    - Return a new array(not the same array with mutation)

  - implicit:
   - the words will be ordererd by the index at [0, 1, 2...]

E(below):

Data-struct:

Algorithm:
- As we have a nested array we iterate on the sub-arrays
- on each sub-array we iterate again this time we use sort
  as the spaceship operator but in an inverse way.
- we need to check specific case of words to see how it sorts.
  in case is not working as expected we need to add sort
  by index on words.
- we return a new array with the same size and transformed data.

C
=end

# short version
def sort_desc(nest_ary)
  nest_ary.map { |ary| ary.sort.reverse }
end

#longer version and original answer
def sort_desc(nest_ary)
  nest_ary.map do |ary|
    ary.sort { |a, b| b <=> a }
  end
end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sort_desc(arr) ==  [['c','b','a'], [3,2,1], ['green', 'blue', 'black']]

```

***Original Answer***
*From the problem description we know that we need to return a `new array` but with the items in it transformed in some way, so `map` should hopefully be a fairly obvious choice for the initial method to call on the array.*

*We also know that we want each sub-array to be ordered, so within the block that we pass to map we can call sort on the `sub-array` for that iteration. Since we want the sub-arrays sorted in `reverse` order we need to call it with a `block`, within which we change the order of `a` and `b`.*

</details>
</br>


#### Practice Problem 10

Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

```ruby .numberLines
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
```

<details>
<summary>Answer</summary>

```ruby .numberLines
=begin
Problem understanding:
  - mental model:
    We have a nested array of hashes. We want to increment
    each value+1 returning a new nested array
  - input: nested array
  - output: new nested array
  rules:/

Algorithm:
iterate the nested array to each hash
from each hash we want to increment just the values
and ond the same time return the hash itself.

Code
=end

# second option
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  hsh.each_with_object({}) do |(key, value), new_hsh|
    new_hsh[key] = value + 1
  end
end == [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}] # true
```

***Original answer***
```ruby .numberLines
# first option(and original answer)
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hsh = {}
  hsh.map { |key, value| new_hsh[key] = value + 1 }
  new_hsh
end == [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}] #true
```
*Here map is iterating through the array. On each iteration it is creating a new hash (incremented_hash) and then iterating through the hsh object for that iteration in order to add key-value pairs to this hash using the original keys but values incremented by 1. The outer block then returns this incremented_hash to map which uses it to transform each element in the array.*

*When approaching problems like this there is often more than one way to solve them. Here is a solution to the same problem using each_with_object instead of map.*

```ruby .numberLines
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
```
*Sometimes a particular method will be more suited than another. Here map is probably more suitable since we know it will return a new array in any case. When deciding which method to use it is important to clearly understand the method implementation, what arguments and blocks can be passed to it and its return value.*

</details>
</br>

####Practice Problem 11
Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

```ruby .numberLines
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
```

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
arr.map {|ary| ary.select { |num| num % 3 == 0 }}
```

***Original answer***

```ruby .numberLines
arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end
# => [[], [3], [9], [15]]
```
*We know that we want to return a new array, so map is a good choice to call on the original array. Technically you could use either select or reject for the nested arrays as both would work, however choosing to use select makes the code a bit more readable. This is what the same solution would look like with `reject`:*

```ruby .numberLines
arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end
# => [[], [3], [9], [15]]
```

*Since the method rejects elements based on the `truthiness` of the evaluated condition, combining `reject` with the `!=` operator seems somewhat like a double negative and is more difficult to parse than select combined with `==`.*
</details>
</br>

####Practice Problem 12
Given the following data structure, and without using the `Array#to_h` method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

```ruby .numberLines
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
```

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
arr.each_with_object({}) {|ary, hash| hash[ary[0]] = ary[1] }
# {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
```


***Original answer***
*Although this task may at first seem complicated because the collection contains different object types, sometimes nested three levels deep, you only really have to work at the initial sub-level in order to reach a solution. Remember that any Ruby object can be a hash key and any Ruby object can be a hash value.*

```ruby .numberLines
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
hsh # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
```
</details>
</br>

####Practice Problem 13*
Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.


```ruby .numberLines
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
```

The sorted array should look like this:

```ruby .numberLines
[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines

# first odd num is the same second is not odd so based on that
arr.sort_by { |ary| ary.last }
#[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
# Hm.. maybe is a bit tricky this way

arr.sort_by { |ary| ary.select {|num| num.odd?} }
# sort by will return a new array as the same size.
#[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```



***Original answer***
*Since the sub-arrays are compared in an 'element-wise' manner when being sorted, when looking at the first element of each they are all equal. If we were to include the second element of each (the even integers) in our comparison the order would be different, since 4 is less than 6, which is less than 8.*

*By performing selection on the sub-arrays that we are comparing, we can compare them based on the value of the odd integers alone.*


```ruby .numberLines
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```
</details>
</br>

####Practice Problem 14*
Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

```ruby .numberLines
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
```
The return value should look like this:

```ruby .numberLines
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
=begin
- Problem understanding:
 - mental model: From a hash of fruits/vegetables
   return an array with:
   - colors of the fruits
   - sizes of vegetables
   sizes should be upper case, colors capitalized.

 - input: hash
 - output: array

 rules:
  - size uppercase
  -colors capitalize

Example/test: above
Data struct:
- Algorithm:
  From a hash, iterate on each key(name) value(details).
  from the value(details).
  - from fruits sub-hash map just the color
  - from vegetables map the map just the size
  - make the size uppercase, make the color downcase.

Code
=end
hsh.map do |_, value|
  value[:type] == 'fruit' ? value[:colors].map(&:capitalize) : value[:size].upcase
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```


***Original answer***
```ruby .numberLines
hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```
*From the problem description we know that we want to return an array where each item in the outer hash is represented by a particular value from within each nested hash, so `map` is a good choice of method to call on the initial `hsh` object.*

*Since the value to be returned to `map` by the outer block depends on whether `:type` equates to `fruit` or `vegetable`, we need to use a conditional statement to determine what is returned and what other actions are performed on those values prior to them being returned by the outer block.*

*The situation for `:colors` is complicated slightly in that we want to call `capitalize` on the strings but they are nested within arrays so we need to iterate through those arrays in order to access them.*

</details>
</br>

####Practice Problem 15
Given this data structure write some code to return an array which contains only the hashes where all the integers are even.


```ruby .numberLines
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
```

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
# input: array
# outuput: array
# goal: return an ARRAY `if` CONTAINS, ONLY the HASH/hashes where `all` `integers`
# are `even`
# As need to be all integers inside the hash we can just have all the values
# and then flatten all sub-array-values inside each hash and evaluate if `all?`
# numbers are even.
arr.select do |hash|
  hash.values.flatten.all? {|num| num.even? }
end
# =>  [{:e=>[8], :f=>[6, 10]}]
```


***Original answer***

```ruby .numberLines
arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
# => [{:e=>[8], :f=>[6, 10]}]
```

*From the problem description it is clear that we will need to return a subset of the objects in the outer array, so `select` should hopefully be a fairly obvious method choice to call on that array. The key is then to figure out how to carry out the selection.*

*Since select will return all the elements for which the block returns true and we only want hashes where **all** the integers are even, `all?` combined with `even?` is a good choice here. The situation is complicated slightly by the fact that the integers are further nested inside the inner arrays, so we need to iterate through these first.*

*If all of the integers in an inner array are even then the inner block returns true to the innermost call to `all?`. If all of the inner blocks for a particular hash return true then the middle block returns `true `to the outer call to `all?` which in turn causes the outer block to return `true` to the `select` method for that iteration.*
</details>
</br>

####Practice Problem 16 *
A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: `"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"`

Write a method that returns one UUID when called with no parameters.

<details>
<summary>Answer</summary>

</br>

```ruby .numberLines
=begin
- Problem understanding:
  - problem domain:
    - hexadecimal characters:  Hexadecimal uses the decimal numbers (0..9) and six extra symbols as letters taken from the English alphabet are used, specifically A, B, C, D, E and F. Hexadecimal A = decimal 10, and hexadecimal F = decimal 15.
  - mental model: we want to write a method that creates 32 random `Hex` chars vidided by `-`
    this way 8-4-4-4-12 and represented as string
    - input: none
    - output:  8-4-4-4-12 HEX chars represented as string
    - rules:
      - explicit: all chars 32 random HEX as string.
      - implicit: `a` to `f` are lowercase
- Example:
  `"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"`
- Data structure:/
- Algorithm:

- Code:
  - initialize a constant `HEX` with all hexadecimal chars
  - define an `uuid` method
  - initialize a val with empty string
  - iterate 32 times and append 32 random exadecimal samples
  - using string iterpolation and index at [init_at, size/length] add the `-`
    as 8, 12, 16, 20.
  - more concrete [0, 8], [8, 4], [12, 4], [16, 4], [20, 12]
=end

HEX = [('0'..'9').to_a ,('a'..'f').to_a].flatten

def uuid
  hex = ''
  32.times { hex << HEX.sample }
  "#{hex[0,8]}-#{hex[8,4]}-#{hex[12,4]}-#{hex[16,4]}-#{hex[20,12]}"
end

```

***Original answer***

```ruby .numberLines
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
```
*The key to this solution is having the `sections` array containing integers representing the number of characters in each section. During each iteration through the array, within the block we can call the `times` method on the integer for that iteration and thus build up the UUID character by character.*

*This is just one possible solution to the problem, and yours may be different. However you solved it though, you will most likely have needed to use one or more iterative methods.*


>*Our solution ignores some complexity concerning the proper way to generate UUIDs. It has a higher probability of creating conflicting values than you might think. See the [RFC 4122](https://tools.ietf.org/html/rfc4122) document for complete details about how to properly generate UUIDs. Better yet, use an RFC 4122-compliant implementation of the algorithm, such as the SecureRandom#uuid method in Ruby's standard library.*

</details>
</br>


____
*letter style meaning on tables:*

***Imporant and extra review***
**To review**
normal
*notes*
**\***: to review and practice more