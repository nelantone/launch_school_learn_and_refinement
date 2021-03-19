1. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby  .numberLines
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```

<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*

On `line 4` we call the method `puts` and we pass as an argument variable `a`. It will return `nil` and output `Goodbye`

On `line 5` we call the method `puts` and we pass as an argument variable `b` . It will return `nil` and output `Hello`

*2. The concept we demostrate here are **variables as pointers**.*

*3. Explanation about the concept (why?):*

On `line 1` we initialize a variable `a` and we we assign to an object `Hello` string.

On `line 2` we initialize a variable `b` to the first one variable `a` who reference `Hello` object.

On `line 3` we reassign the variable `a` and then as we reassign to a new object and a string object is mutable.

Variable `a` and variable `b` stop pointing to the same object and have different object_id, changes on variable `a` assigned to a specific object will not affect variable `b` assigned to another object.

</details>
</br>

2. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```
<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*
On `line 9` we call the method `puts` and passing in a local variable `a` to it as an argument. The return value is nil and the output is `5`.

On `line 10` we call the method `puts` and passing in a local variable `a` to it as an argument. We raise an exception as return value `undefined variable or method #b`.

*2. The concept we demostrate here is **variable scope**.*

*3. Explanation about the concept (why?):*
As initialized variables in the outer scope can be accessed inside a block.
but initialized variables inside a block(as inner scope) can not be accessed.

On `line 1` we are initializing a local variable `a` assigned to an integer object with value `4` to it.

On `line 4` we reassign variable `a` to an integer object with value `5` to it.

On `line 5` we initialize a local variable inside the block scope.

</details>
</br>


3. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```
<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*

On `line 10` we call the method `puts` and we pass as an argument variable `a`. It will return `nil` and output `3`

On `line 11` we call the method `puts` and we pass as an argument variable `b` . It will return `nil` and output `2`

*2. The concept we demostrate here are **variables as pointers**.*

*3. Explanation about the concept (why?):*

On `line 1` we initialize a variable `a` and we we assign to an object `Hello` string.

On `line 5` we initialize a variable `c` to an integer object `3`.

on `line 6` we are initializing the local variable `a` to an integer object that the local variable `c` is referencing. In this case variable `c` is pointing to the object integer `3`. variable `a` and `c` are **pointing to the same object**.

</br>
</details>
</br>

4. What does the following code return? What does it output? Why? What concept does it demonstrate?
``` ruby .numberLines
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```
<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*

From `line 1-8` we define the method `example` with one parameter named `str` .

On `line 10` we call the method `example` and we pass as an argument a string object `hello` .

It will return `nil` and output `hello` 3 times:
`hello`
`hello`
`hello`

*2. The concept we demostrate here is **method definition and method invocation and how loop method works**.*

*3. Explanation about the concept (why?):*

On line `2` we are initializing a local variable `i` assigned to an integer object with value `3` to it.

On line `3` inside the loop, we call the loop method passing in the `do..end` block as an argument.

On line `3 to 7` we call a block. *

On `line 4` we call the method `puts` and passing in a local variable `str` to it as an argument.

On line `5` inside the block, we reassign variable `i` to itself as 
`i -= 1` is equivalent to `i = i - 1`

On line `6` inside the block, we reassign variable `i` to itself as 
`i -= 1` is equivalent to `i = i - 1`

On `line 6` we are **breaking out the loop by using the keyword** `break` if the **value of the object that local variable** `i` is **referencing is equal to** 0**.**
</br>

</br>

</br>
</details>
</br>


5. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)
```
<details>
<summary>Answer</summary>

*1. The following code return/output:*

From `line 1-3` we define the method `greetings` with one parameter named `str` .

On `line 6` we are initializing a local variable `word` assigned to a string object with value `Hello` to it.

On `line 8` we call the method `greetings` and we pass `word` as argument

It will return `nil` and output:
`hello`
`goodbye`

*2. The concept we demostrate here is **method definiticion, method invocation and passing a local variable as argument**.*

*3. Explanation about the concept (why?):*

On `line 8` when we pass `word` local variable as an argument, we can see the method definition and the paramater `str`.
From this moment on, `word` and `str` are pointing to the same object.
</br>
</details>
</br>


6. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end

puts "Your total is #{sum}"
```
<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*

On `line 12` we call the method `puts` and passing in a string object  with a local variable `sum` string-interpolated to it as an argument.

*2. The concept we demostrate here is **How works the loop method call, scope of the variables and #+= oprator**.*

*3. Explanation about the concept (why?):*

On `line 1` we are initializing a local variable `arr` assigned to an array object collection with `1 to 4` integer elements to it.

On `line 6-10` we call the loop method passing in the `do..end` block as an argument

On `line 7` we are adding each element using `[]` index at method passing in each iteration element at `arr[0], arr[1]...` until
counter (that we add +1 on each ieration a `counter = counter + 1`)
is equal to the `arr.size`, then on `line 9` we break the condition.

*** *it took me 10min to explain*

</br>
</details>
</br>


7. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```
<details>
<summary>Answer</summary>

</br>
*1. The following code return/output:*

On `line 7` we use the method `p`, this methods inspect the object refeenced in the variable and return/output the result.
In this case the variable `a` is reassigned insie the `times` block and from then is pointing to the string object 'Bill'.


*2. The concept we demostrate here is **Reassignation inside a block and how can initialized method outside a block can be accessed and modified inside the block**.*

*3. Explanation about the concept (why?):*


On `line 1` we are initializing the local variable `a` to a string object 'Bob'.

On `line 4` we reassign the variable `a` to object string `Bill` and as we use th method `times` on integer `5`, it will iterate and reassign the variable to `a` 5 times then will exit the loop.
</br>
</details>
</br>

8. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```
<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*

On `line 9` we call the method `puts` and passing in a local variable `animal` to it as an argument. Using `puts` the return value is always nil, the output is `cat` as animal is reassigned inside the loop rfering to he string object `cat`.

On `line 10` we call the method `puts` and passing in a local variable `animal` to it as an argument. In this case we will raise an exception as `var` is initialized inside the block and we can't access outside of it.

*2. The concept we demostrate here is **Variable scope, local variables initialized outside a block can be accessed inside but not biceversa**.*


</br>
</details>
</br>


####Variable Shadowing

1.What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```

<details>
<summary>Answer</summary>

</br>

</br>
</details>
</br>