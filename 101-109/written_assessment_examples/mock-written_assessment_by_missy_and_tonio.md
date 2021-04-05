#### Welcome to the written assesment test.

Before you start, please follow the instructions and take a look on the recommendations on the [Readme file](https://github.com/nelantone/launch_school_learn_and_refinement/tree/main/101-109/written_assessment_examples).



<details>
<summary>Question 1</summary>

</br>

1. What does this code output and return? Why? What is the value of name?
```ruby .numberLines
name = ‘missy’

puts "Hi, #{name.capitalize!}"
```

</br>
</details>
</br>



<details>
<summary>Question 2</summary>

</br>

2. What does this code output and return? Why?
```ruby .numberLines
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```


</br>
</details>
</br>

<details>
<summary>Question 3</summary>

</br>

3. What does this code output? Why?
```ruby .numberLines
animal = "dog"

loop do |x|
  animal = "cat"
  break
end

puts animal
```


</br>
</details>
</br>


<details>
<summary>Question 4</summary>

</br>

4. Why do we get an error when this code is run? How could we fix it?
```ruby .numberLines
qualities = ['fluffy', 'orange']

def say_qualities
 puts "The cat is #{qualities[0]}."
 puts "The cat is #{qualities[1]}."
end

say_qualities
```


</br>
</details>
</br>

<details>
<summary>Question 5</summary>

</br>

5. What is output on lines 5 and 6, and why?
```ruby .numberLines
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd
p even
```


</br>
</details>
</br>

<details>
<summary>Question 6</summary>

</br>

6. What are s and t? Why?
```ruby .numberLines
def fix(value)
 value[1] = 'x'
 value
end

s = 'abc'
t = fix(s)
```


</br>
</details>
</br>

<details>
<summary>Question 7</summary>

</br>

7. What does the last line of this code return? Why?
```ruby .numberLines
num = 3

num = 2 * num
```


</br>
</details>
</br>

<details>
<summary>Question 8</summary>

</br>

8. What does the last line of this code output? Why?
```ruby .numberLines
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

</br>
</details>
</br>


<details>
<summary>Question 9</summary>

</br>

9. What does this code return? Why?
```ruby .numberLines
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```


</br>
</details>
</br>

<details>
<summary>Question 10</summary>

</br>

10. What does this code output? What does it return? Why?
```ruby .numberLines
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
  puts n
end

p new_array
```


</br>
</details>
</br>

<details>
<summary>Question 11</summary>

</br>

11. All variables are pointing to the same object? Why/Why not? If not, how can we fix it in order to point all variables to the same object and then what will be the return value?
```ruby .numberLines
a = [1, 2, 3, 3]
b = a
c = a.uniq
```


</br>
</details>
</br>

<details>
<summary>Question 12</summary>

</br>



12. What does the last line of following code return and output? Why?
```ruby .numberLines
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```


</br>
</details>
</br>


<details>
<summary>Question 13</summary>

</br>

13.  What do the following code blocks return?  What does it output? Why?
```ruby .numberLines
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
```


</br>
</details>
</br>

<details>
<summary>Question 14</summary>

</br>

14. What does this code return? Why?
```ruby .numberLines
sorted =  ['cot', 'bed', 'mat'].sort_by do |word|
 word[1]
end

p sorted
```


</br>
</details>
</br>

<details>
<summary>Question 15</summary>

</br>

15. The 3 variables have the same return value? Why/Why not? There is a way that we can mutate and uppercase the 3 variables changing one line of this code?
```ruby .numberLines
arr1 = ["a", "b", "c"]
arr2 = arr1
arr3 = arr2.map do |char|
 char.upcase
end
```

</br>
</details>
</br>

<details>
<summary>Question 16</summary>

</br>

16. What would be the return value of `a` and `b`  inside the block? And outside the block? why?
```ruby .numberLines
a = ['a', 'b', 'c']
b = ['e', 'f', 'g']

a = a.each_with_object([]) do|b, ary|
  ary << b
  p b, a
end

p a
```

</br>
</details>
</br>

<details>
<summary>Question 17</summary>

</br>

17. What is the underlying principle by which the order here was determined, and how was it implemented?
```ruby .numberLines
arr = ['10', '11', '9', '7', '8']
sorted =  arr.sort
p sorted
```


</br>
</details>
</br>

<details>
<summary>Question 18</summary>

</br>

18. What is the return value of  `a`, `b` and  `c` ? Why?  Which concept demonstrates?
```ruby .numberLines
a = ['a', 'b', 'c']
b = ['e', 'f', 'g']
c = ['x']

a.each do |b|
 c = ['h', 'i', 'j']
 b = 'ups!'
end

a
b
c
```


</br>
</details>
</br>

<details>
<summary>Question 19</summary>

</br>

19. What is the output and return value of this code? Why ? how we can convert the return value to an object array? And to have back a hash?
```ruby .numberLines
hsh = {a: 1, b: 2, c: 3}
hsh.map { |k, v| [k.to_s, v - 1] }

p hsh
```

</br>
</details>
</br>

<details>
<summary>Question 20</summary>

</br>

20. What is the output and return value of this code? Why?
```ruby .numberLines
people = { Kate: 27, john: 25, Mike: 18, Lisa:14 }
people.select! { |_, age| age >= 18 }
p people.sort { |name1, name2| name1[0] <=> name2[0] }
```


</br>
</details>
</br>

This test was made by course examples, another student examples and with some our own solved doubts.

*Copy left by Missy and Tonio*