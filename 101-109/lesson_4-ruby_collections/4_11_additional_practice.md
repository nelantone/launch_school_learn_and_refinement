**Practice Problem 1**
Given the array below

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```

Turn this array into a hash where the names are the keys and the values are the positions in the array.

<details><summary>Answer</summary>

My answer:

```ruby
counter = 0
flintstones_hash2 = flintstones.each_with_object({}) do|value, hash|
  hash[value] = counter
  counter += 1
end
```
***
solution:

```ruby
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
```
***
</details>
</br>

**Practice Problem 2**

Add up all of the ages from the Munster family hash:
`ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }`

<details><summary>Answer</summary>

My solution:

```ruby

ages.values.sum
#or
ages.values.reduce(:+)
```
***
Solution:

*One solution would be to assign a variable to an initial value of 0 and then iterate through the Hash adding each value in turn to the total.*

```ruby
total_ages = 0
ages.each { |_,age| total_ages += age }
total_ages # => 6174
```

*Another option would be to use a Enumerable#inject method.*

```ruby
ages.values.inject(:+) # => 6174
```

*This uses ages.values to make an array, then uses the inject method which is part of the Enumerable module. The strange-looking parameter to inject is simply a variety of the inject method which says "apply the + operator to the accumulator and object parameters of inject".*

*As we have previously discussed, Enumerable is included in Array, and it can be useful to augment your knowledge of what you can do with arrays by studying Enumerable. When faced with a problem such as this one however, don't get tempted to go 'method hunting' in order to reach a solution. As demonstrated, even if you don't know the #inject method, the problem can be solved equally well by using #each to iterate through the Hash; you could even use a basic loop to reach the same result.*
***
</details>
</br>


**Practice Problem 3**

In the age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

remove people with age 100 and greater.

<details><summary>Answer</summary>

My solution:

```ruby
ages.select! {|_, age_value| age_value <= 100 }
```

***
Solution:

```ruby
ages.keep_if { |_, age| age < 100 }
```

*You could also use #select! here. When using similar methods however, it is important to be aware of the subtle differences in their implementation. For example, the Ruby Documentation for Hash#select! tells us that it is "Equivalent to Hash#keep_if, but returns nil if no changes were made", though in this case that wouldn't have made any difference.*

***
</details>
</br>

**Practice Problem 4**

Pick out the minimum age from our current Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

<details><summary>Answer</summary>
My solution/Solution:

```ruby
ages.values.min
```

***
</details>
</br>

**Practice Problem 5**
In the array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Find the index of the first name that starts with "Be"


<details><summary>Answer</summary>
My solution

```ruby
flintstones.index { |name| name.start_with?('Be') }
```

***
Solution:

```ruby
flintstones.index { |name| name[0, 2] == "Be" }
```

***
</details>
</br>


**Practice Problem 6**
Amend this array so that the names are all shortened to just the first three characters:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

<details><summary>Answer</summary>
My solution

```ruby
flintstones.map! { |name| name.slice(0..2) }
```
`#slice` we need to be aware that `#slice!`(destructive) return of the block is the defined range but the return of the array will be the other part(not the selected range slice).

wrongn solution...
```ruby
flintstones.map { |name| name.slice!(0..2) }
# => ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]
flintstones # => ["d", "ney", "ma", "ty", "Bam", "bles"]
```

***
Solution:

```ruby
flintstones.map! { |name| name[0, 3] }
```

***
</details>
</br>

Practice Problem 7
Create a hash that expresses the frequency with which each letter occurs in this string:

```ruby
statement = "The Flintstones Rock"
```
ex:

```ruby
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
```

<details><summary>Answer</summary>
My solution:

Input: string
Output: hash
Implicit rules:
- Case sensitive(upcase and downcase appart)
- Only letters(so don't count space and another characters)
- Doesn't need validation.

```ruby
array_letters_char = statement.chars

result2 = array_letters_char.each_with_object({}) do |letter, hash|
  hash[letter] = array_letters_char.count(letter) unless (hash.key?(letter) || letter == ' ')
end
```

***
Solution:

```ruby
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
```


***R-doc:***
> `String#scan` 
> ```ruby
>  str.scan(pattern)                        #-> array
>  str.scan(pattern) {|match, ...| block }  # -> str
>```
>------------------------------------------------------------------------
>
>Both forms iterate through str, matching the pattern (which may
>be a Regexp or a String). For each match, a result is generated and
> either added to the result array or passed to the block
> ```ruby
>a = "cruel world"
>  a.scan(/\w+/)        #=> ["cruel", "world"]
>  a.scan(/.../)        #=> ["cru", "el ", "wor"]
>  a.scan(/(...)/)      #=> [["cru"], ["el "], ["wor"]]
>  a.scan(/(..)(..)/)   #=> [["cr", "ue"], ["l ", "wo"]]
> ```



***
</details>
</br>


**Practice Problem 8**
What happens when we modify an array while we are iterating over it?
8.1 What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```

8.2 What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

<details><summary>Answer</summary>

My solution:

8.1: Mutating the array in this case with `.shift` while iterating is a bad practice!
iterations
1) `index 0` output 1, transformed array `[2,3,4]`,
2) `index 1` `3` output 3, transformed array `[3,4]`,
3) `index 2` `nil`

output 1\n 3\n
return [3,4]


8.2: Mutating the array in this case with `.pop` while iterating is a bad practice!

1) `index 0` output 1, transformed array `[1,2,3]`
2) `index 1` output 2, transformed array `[1,2]`
3) `index 2` `nil`

ouput 1\n, 2\n
return [1,2]

***
Solution:

*first one...*

```ruby
1
3
```
*second one...*

```ruby
1
2
```
*To better understand what is happening here, we augment our loop with some additional "debugging" information:*

```ruby
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end
```
*The output is:*

```ruby
"0  [1, 2, 3, 4]  1"
"1  [2, 3, 4]  3"
```
*From this we see that our array is being changed as we go (shortened and shifted), and the loop counter used by #each is compared against the current length of the array rather than its original length.*

*In our first example, the removal of the first item in the first pass changes the value found for the second pass.*

*In our second example, we are shortening the array each pass just as in the first example...but the items removed are beyond the point we are sampling from in the abbreviated loop.*

*In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. They operate on the original array in real time.*
***
</details>
</br>


**Practice Problem 9**
As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

```ruby
words = "the flintstones rock"
```
would be:

```ruby
words = "The Flintstones Rock"
```
Write your own version of the rails titleize implementation.

<details><summary>Answer</summary>
My solution

```ruby
def titelize(string)
  string.split.each(&:capitalize!).join(' ')
end

```

***
Solution:

```ruby
words.split.map { |word| word.capitalize }.join(' ')`
```
***
</details>
</br>


**Practice Problem 10**
Given the munsters hash below

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```
Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

```ruby
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
```
Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

<details><summary>Answer</summary>
My solution / Solution:

```ruby
munsters.each do |_, info|
  case info['age']
  when 0..17 then info["age_group"] = 'kid'
  when 18..64 then info["age_group"] = 'adult'
  else info["age_group"] = 'senior'
  end
end
```

***
</details>
</br>