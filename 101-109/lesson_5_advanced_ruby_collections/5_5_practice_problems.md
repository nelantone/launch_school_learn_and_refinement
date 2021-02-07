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



#### Practice Problem 7
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

```ruby .numberLines

```

***Original answer***
```ruby .numberLines

```

**

</details>
</br>


</br></br></br></br></br></br></br></br></br></br></br>

#### Practice Problem 

```ruby .numberLines

```

<details>
<summary>Answer</summary>

```ruby .numberLines

```

***Original answer***
```ruby .numberLines

```

**

</details>
</br>


#### Practice Problem 

```ruby .numberLines

```

<details>
<summary>Answer</summary>

```ruby .numberLines

```

***Original answer***
```ruby .numberLines

```

**

</details>
</br>


#### Practice Problem 

```ruby .numberLines

```

<details>
<summary>Answer</summary>

```ruby .numberLines

```

***Original answer***
```ruby .numberLines

```

**

</details>
</br>