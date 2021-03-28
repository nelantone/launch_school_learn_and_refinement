1. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby  .numberLines
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```

######hello

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

*1. The following code return/output:*

On `line 9` we call the method `puts` and passing in a local variable `a` to it as an argument. Using `puts` the return value is always nil, the output is `4`.

On `line 10` we call the method `puts` and passing in a local variable `b` to it as an argument. Using `puts` the return value is always nil, the output is `2`.

*2. The concept we demostrate here is **Variable Shadowing**:*
When we initialize a local variable and we use the same name in a block parameter, the local variable will be protected
and the block parameter will only have inner scope and it will not be possible to reassign or change the localvariable
inside the block.

*3. Explanation about the concept (why?):*

On `line 4` we are calling the method `times` on integer 2 and we pass as an argument a `do..end` block with a block
parameter with the same name as our local variable `on line 1` `a` so this variable will not be the same as `a`
`on line 5-6` and block parameter `a` it will be only accessed inside the block (as explained befor in the variable shadowing concept)


</br>
</details>
</br>


2. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
n = 10

1.times do |n|
  n = 11
end

puts n
```
<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*

On `line 7` we call the method `puts` and passing in a local variable `n` to it as an argument. Using `puts` the return value is always `nil`, the output is `10`.


*2. The concept we demostrate here is **Variable Shadowing**:*
When we initialize a local variable and we use the same name in a block parameter( int his case `n`), the local variable will be protected and the block parameter will only have inner scope and it will not be possible to reassign or change the local variable `on line 3-5` where is the block.

*3. Explanation about the concept (why?):*

On `line 3` we are calling the method `times` on integer 1 and we pass as an argument a `do..end` block, with a block
parameter with the same name as our local variable `on line 1` `n` so this variable will not be the same as `n`
`on line 4` and it will be only accessed inside the block (as explained befor in the variable shadowing concept).


</br>
</details>
</br>


3. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
```

<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*

On `line 8` we call the method `puts` and passing in a local variable `animal` to it as an argument. Using `puts` the return value is always `nil`, the output is `dog`.


*2. The concept we demostrate here is **Variable Shadowing**:*
When we initialize a local variable and we use the same name in a block parameter( int his case `animal`), the local variable will be protected and the block parameter will only have inner scope and it will not be possible to reassign or change the local variable `on line 3-6` where is the block.

*3. Explanation about the concept (why?):*

On `line 3` we are calling the method `loop` on integer 1 and we pass as an argument a `do..end` block, with a block
parameter with the same name as our local variable `on line 1` `animal` so this variable will not be the same as `animal`
block variable `on line 3-4` and it will be only accessed inside the block (as explained before in the variable
shadowing concept).


</br>
</details>
</br>


#### Object Passing/Variables As Pointers
1. What does the following code return? What does it output? Why? What concept does it demonstrate?
**What are a and b?**
```ruby .numberLines
a = "hi there"
b = a
a = "not here"
```


<details>
<summary>Answer</summary>

</br>

*1. What are a and b?*
  `a` and `b` are variables pointing or refering to a specific object in memory.


*2. The concept we demostrate here is **Variables as pointers**:*

*3. Explanation about the concept (why?):*

On `line 1` we are initializing a local variable `a` assigned to an string object with value `hi there` to it.

on `line 2` we are initializing the local variable `b` to an integer object that the local variable `a` is referencing.  Currently, both of these local variables are **pointing to the same object**.

On `line 3` we reassign the variable `a` to a new string object with value `not here` but variable `b` still pointing
to string object` hi there`. **From this moment variable `a` and `b`  stop referring to the same object**.

</br>
</details>
</br>


2. What does the following code return? What does it output? Why? What concept does it demonstrate?
**What are a and b?**
```ruby .numberLines
a = "hi there"
b = a
a << ", Bob"
```

<details>
<summary>Answer</summary>

</br>

*1. What are a and b?*
  `a` and `b` are variables pointing or refering to a specific object in memory.


*2. The concept we demostrate here is **Variables as pointers**:*

*3. Explanation about the concept (why?):*

On `line 1` we are initializing a local variable `a` assigned to an string object with value `hi there` to it.

on `line 2` we are initializing the local variable `b` to an integer object that the local variable `a` is referencing.  Currently, both of these local variables are **pointing to the same object**.

On `line 3` we  have the destructive method `<<` on the variable `a`. And an object string `, Bob` passed as an argoument. **Method `<<` will concatenate the object string `, Bob` and will mutate the string object `hi there` as is
a destructive method it will modify the string object pointing to `a` and `b` and both variables will reference the same object with the string `hi there, Bob`**.

</br>
</details>
</br>


3. What does the following code return? What does it output? Why? What concept does it demonstrate?
**What are a, b, and c? What if the last line was `c = a.uniq!`?**
```ruby .numberLines
a = [1, 2, 3, 3]
b = a
c = a.uniq
```

<details>
<summary>Answer</summary>

</br>

*1. What are a, b and c?*
  `a` is pointing to the array collection `[1, 2, 3, 3]` with inetgers as elements
  `b` is initialized and assigned to the object variable `a` is referencing
  string object `[1, 2, 3, 3]`
  `c` is initialized pointing to a new object as:
  `On line 3` we have the non destructive method `uniq` on variable `a` referencing the object
  `[1, 2, 3, 3]`. Method `uniq` will create a new array with the uniq elements on the collection
  in this case the new object that variable `c` will be  assigned it will be the array `[1, 2, 3]`


*2. What if the last line was `c = a.uniq!`?*
  in this case the method `on line 3` would be the destructuive method `uniq!` variables `a, b and c` will be referencing
  the same mutated object. Method `uniq!` will mutate the array object and will return the uniq elements on the collection in this case the mutated object `a,b and c` will be  assigned it will be the array `[1, 2, 3]`

*2. The concept we demostrate here is **Variables as pointers**:*

*3. Explanation about the concept (why?):* (explained on 1.)

*** It took me 3 more min than expected
</br>
</details>
</br>


4. What does the following code return? What does it output? Why? What concept does it demonstrate?
**What is `a`? What if we called `map!` instead of `map`?**

```ruby .numberLines
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```

<details>
<summary>Answer</summary>

</br>

*1. What is `a`?*
On `line 1`  we have a method `test` definition passing `b` as parameter
On `line 2` we have `map` non-destructive method on `b` then we are sure the argument we
we pass and will reference to the same object (`a` will reference to `b` in this case) will make
`a` to still pointing to the array collection with sting objects `['a', 'b', 'c']`


*2.  What if we called `map!` instead of `map`?*
In this case on `line 2` we will have `map!` destructive method on `b` then we are sure the argument we
we pass and will reference to the same object (`a` will reference to `b` in this case) will make
`a` to mutate with the transformation of the return value of the block. In this case `a` will reference to the same
mutated array object with the string collection `["I like the letter: a", "I like the letter: b", "I like the letter: c"]` as the block is transforming each element using string-interpolation on each element like `"I like the letter: #{letter}"`.
`a` will still pointing to the array collection object but this time with mutated sting objects `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`

*2. The concept we demostrate here is **Variables as pointers**:*

*3. Explanation about the concept (why?):* (explained on 1.)

*** I used 4 min more than expected
</br>
</details>
</br>


5. What does the following code return? What does it output? Why? What concept does it demonstrate?
**What is `a` and `b`? Why?**
```ruby .numberLines
a = 5.2
b = 7.3

a = b

b += 1.1
```

<details>
<summary>Answer</summary>

</br>

*1. What is `a`  and `b`? Why?*
`a` is assigned to the float object `7.3`
`b` is assigned to the float object `8.4`


On `line 1` we are initializing a local variable `a` assigned to an float object with value `7.3` to it.
On `line 2` we are initializing a local variable `b` assigned to an float object with value `8.4` to it.

On `line 4` we reassign the local variable `a` to an float object that the local variable `b` . **From this moment variable `a` and `b`  stop referring to the same object**.

on `line 6` we use the non destructive method `+=`  on  variable `b` who is pointing to the float object `7.3` and we pass a float object `1.1` as argument.
The non destructive method `+=` is equivalent to `b = b + 1.1` then we are reasiginig and **from that moment variable `a`
and variable `b` are pointing/referencing to a different object.**

*2. The concept we demostrate here is **Variables as pointers**:*

*3. Explanation about the concept (why?):* (explained on 1.)

** Toook 2 more minutes as expected
</br>
</details>
</br>


6. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```

<details>
<summary>Answer</summary>

</br>

*1. What is `a`  and `b`? Why?*
`a` is assigned to the float object `7.3`
`b` is assigned to the float object `8.4`


On `line 1` we are initializing a local variable `a` assigned to an float object with value `7.3` to it.
On `line 2` we are initializing a local variable `b` assigned to an float object with value `8.4` to it.

On `line 4` we reassign the local variable `a` to an float object that the local variable `b` . **From this moment variable `a` and `b`  stop referring to the same object**.

on `line 6` we use the non destructive method `+=`  on  variable `b` who is pointing to the float object `7.3` and we pass a float object `1.1` as argument.
The non destructive method `+=` is equivalent to `b = b + 1.1` then we are reasiginig and **from that moment variable `a`
and variable `b` are pointing/referencing to a different object.**

*2. The concept we demostrate here is **Variables as pointers**:*

*3. Explanation about the concept (why?):* (explained on 1.)

** Toook 2 more minutes as expected
</br>
</details>
</br>


7. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
```

<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*
On `line 8` we call the method `puts` and passing in a local variable `a` to it as an argument.
It will return `nil` and outputs `3`

On `line 9` we call the method `puts` and passing in a local variable `a` to it as an argument.
It will return `nil` and outputs `5`

*2. The concept we demostrate here is **Variables as pointers and object passing as argument by value**:*

*3. Explanation about the concept (why?):*
On lines `1-3` we are defining the method `plus` which takes 2 parameters `x` and `y`.

On `line 5` we are initializing a local variable `a` assigned to an integer object with value `3` to it.
On `line 6` we are initializing a local variable `b` assigned  the return value of the calling the method `plus` and passing in the integers `2` (as variable `a` object is refering)  and object integer `2` as an arguments to it.

On `line 1` variable `a` as an argument is refering to the same object as `x`
On `line 2` variable `x` as an argument is reassigned to variable `x + 2` as `y` is refering to the object integer 2.
From this moment will stop pointing to the same object, also because on the same time the integer objects are inmmutable.

** Toook 4 more minutes as expected

</br>
</details>
</br>


8. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
def increment(x)
  x << 'b'
end

y = 'a'
increment(y)

puts y
```

<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*

On `line 8` we call the method `puts` and passing in a local variable `y` to it as an argument.
It returns `nil` and output `ab`

*2. The concept we demostrate here is **Variables as pointers and object passing as argument by reference**:*

*3. Explanation about the concept (why?):*

On lines `1-3` we are defining the method `increment` which takes 1 parameter `x`.
On line `2` inside the method we have the destructive method `<<` on `x`

On `line 5` we are initializing a local variable `y` assigned to an string object `a` to it.
On `line 6` we are calling the method `increment` and passing as argument in the variable `y` who is referencing the string object `a` from this moment. `x` and `y` are refering to the same string object `a`.

On line `2` we use the concatenating destructive method `<<` the object will be mutated and we will concatenate 'b' inside the same object. inner scope variable `x` and local variable `y` will reference to the same string object `ab`.

** Toook 2 more minutes as expected
</br>
</details>
</br>


9. What does the following code return? What does it output? Why? What concept does it demonstrate?
**does this reassignment change the object outside the method?**

```ruby .numberLines
def change_name(name)
  name = 'bob'
end

name = 'jim'
change_name(name)
puts name
```
<details>
<summary>Answer</summary>

</br>
*0. Does this reassignment change the object outside the method?*

No, it does not change the object outside the method

*1. The following code return/output:*

On `line 7` we call the method `puts` and passing in a local variable `y` to it as an argument.
It returns `nil` and output `ab`

*2. The concept we demostrate here is **Variables as pointers and object passing as argument by value**:*

*3. Explanation about the concept (why?):*

On lines `1-3` we are defining the method `change_name` which takes 1 parameter `name`.
On line `2` inside the method we reassign `name` to a new string object `bob`

On `line 5` we are initializing a local variable `name` assigned to an string object `jim` to it.
On `line 6` we are calling the method `change_name` and passing as argument in the variable `name` who is referencing the string object `jim` from this moment. `name` and `name as the block parameter` are refering to the same string object `jim`.

On line `2` as we reassign, inner scope variable `name` and local variable `name` will reference to a different string object. inner sope `name` is reassigned to the string object `bob` and local variable `name` will still point to the
same string object `jim`.


** Toook 2 more minutes as expected
</br>
</details>
</br>


10. What does the following code return? What does it output? Why? What concept does it demonstrate?
**does this affect the object outside the method?**

```ruby .numberLines
def cap(str)
  str.capitalize!
end

name = "jim"
cap(name)
puts name
```
<details>
<summary>Answer</summary>

</br>

*0. Does this reassignment change the object outside the method?*
Yes, it does, on the method `cap` we are passing `name` object argument by reference and mutating
the object referenced.

*1. The following code return/output:*

On `line 7` we call the method `puts` and passing in a local variable `name` to it as an argument.
It returns `nil` and output `Jim`.

*2. The concept we demostrate here is **Variables as pointers and object passing as argument by reference**:*

*3. Explanation about the concept (why?):*

On lines `1-3` we are defining the method `cap` which takes 1 parameter `str`.
On line `2` inside the method we use the destructive method `capitalize!` on `str` variable.

On `line 5` we are initializing a local variable `name` assigned to an string object `jim` to it.
On `line 6` we are calling the method `cap` and passing as argument in the variable `name` who is referencing the string object `jim` from this moment. `name` and `str` the block parameter are refering to the same string object `jim`.

On line `2` as we use the destructive method `capitalize!` the object referenced by variable `str` and `name` will be
mutated.  object string `jim` will be capitalized as `Jim` and we will still have the same initial object.

** Toook 1 more minute as expected
</br>
</details>
</br>


11. **What is `arr`? Why? What concept does it demonstrate?**
```ruby .numberLines
a = [1, 3]
b = [2]
arr = [a, b]
arr

a[1] = 5
arr
```
<details>
<summary>Answer</summary>

</br>

*0. What is `arr`?*
`arr` is a  nested array of 2 arrays with integers as objects.
On `line 7` `arr` variable will return the refered object mutated as `[[1, 5],[2]]`

*1. Why?*
On `line 1` we are initializing a local variable `a` assigned to an array with integer elements `[1, 2]` to it.
On `line 2` we are initializing a local variable `b` assigned to an array with integer element `[2]` to it.

on `line 3` we are initializing the local variable `arr` to an array object that the local variable that includes inside variable `a` and `b` array refering objects.

on `line 4` we do an index reassigment `=[]` destructive method form variable `a` at `index 1` and we reassign the object integer `5`.

on `line 5` as the index reassigment is a mutation, variable `a` will point now to the same object but will be mutated
to the array collection `[1, 5]` and as `arr` nested array it's stil referencing to the same object `a` because is `[a, b]` it will be also mutated and will have the same `arr` object `a` so as, explained before. will return.
`[[1, 5],[2]]`

*** 5 min more as expected

*2. The concept we demostrate here is **Variables as pointers and how works index reassigment in a nested array**:*

</br>
</details>
</br>


12.  What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby  .numberLines
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1
puts arr2
```
<details>
<summary>Answer</summary>

</br>

*1. The following code return/output:*

On `line 7` we call the method `puts` and passing in a local variable `arr1` to it as an argument.
It returns `nil` and output `a \n b n\ c`.

On `line 8` we call the method `puts` and passing in a local variable `arr2` to it as an argument.
It returns `nil` and output `A \n B n\ C`.

*2. The concept we demostrate here is **Variables as pointers and `dup` method creating shallow copyes of an object**:*

*3. Explanation about the concept (why?):*

On `line 1` we are initializing a local variable `arr1` assigned to an array object collection with string elements `["a", "b", "c"]` to it.
On `line 2` we are initializing a local variable `arr2` assigned to the method `dup` on `arr1` referencing the arry object `["a", "b", "c"]`. `dup` will create a shallow copy(a new object) copy of the object `arr1`.

On `line 3` we are calling the `map!` destructive method on local variable `arr2` who is refering to the aray object `["a", "b", "c"]` and passing in the `do..end` block as an argument with one block parameter `char`.

On `line 4` inside the block, we use the method `upcase` on each element passed. and as `map~` uses the return value of the block, ans we are using the destructive version shown as `!` with the `bang` operator it will mutate `arr2` object.

* The reasons is not mutating arr1 is because arr2 is a shallow copy
* `\n` are jumping lines in the ouput.

**** 8 minutes more as expected!!!
</br>
</details>
</br>

### Object Mutability/Mutating Methods

1. What does the following code return? What does it output? Why? What concept does it demonstrate?
**What values do `s` and `t` have? Why?**

```ruby .numberLines
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

<details>
<summary>Answer</summary>

</br>

*1. What values do `s` and `t` have? Why?*

On `line 7` the variable `s` is initialized and assigned to the string object `hello`
On `line 8` we call the method `fix` and we pass variable `s` as an argument
As the method is defined `on line 1-5` we can see that block parameter `value` has
2 destructive methods on, `upcase!` who upcases each character inside the string
and `concat`(also destructive) who concatenate in this case the string object `!`
inside the string object. As `value` and `s` in this case always point to the same
object and the return value is  of the method`value`.
`on line 8` variables `t` and `s` will point to the same string object 'HELLO!'

*2. The concept we demostrate here is **Variables as pointers and pass a argument by reference**:*

*** 2 and half extra min from 7!

</br>
</details>
</br>

2. What does the following code return? What does it output? Why? What concept does it demonstrate?
**What values do `s` and `t` have? Why?**

```ruby .numberLines
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

<details>
<summary>Answer</summary>

</br>

*1. What values do `s` and `t` have? Why?*

On `line 6` the variable `s` is initialized and assigned to the string object `hello`
On `line 7` we call the method `fix` and we pass variable `s` as an argument
As the method is defined `on line 1-5`.

On `line 2` we can see that we reassign the variable `value` to the same object but upcased with a non destructive metod `upcase` on variable `value` to the reference string object `hello`, thn we will have a new string object `HELLO` assigned to value  , `upcase` who upcases each character inside the string.
**From this point the local variabe `s` and `value` are refferencing to a different object**
On `line 3` even `concat` that is destructive, concatenate in this case the string object `!` but only to inner scope object referenced by `value`.

inside the string object. As `value` and `s` in this case stop pointing to the same
object and the return value is different.

`on line 8` variables `t` is pointing to the string object `HELLO!` and `s` keeps
pointing to the string object `hello`

*2. The concept we demostrate here is **Variables as pointers and pass a argument by value**:*

*** 2 and half extra min from 7!

</br>
</details>
</br>

3. What does the following code return? What does it output? Why? What concept does it demonstrate?
**What values do `s` and `t` have? Why?**

```ruby .numberLines
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

<details>
<summary>Answer</summary>

</br>

*1. What values do `s` and `t` have? Why?*

On `line 7` the variable `s` is initialized and assigned to the string object `hello`
On `line 8` we call the method `fix` and we pass variable `s` as an argument
As the method is defined `on line 1-5`.

Variable `s` will be assigned to the string object `helloxyz`
Variable `t` will be pointing to the string object `HELLOXYZ!`
The main reason is the reassigment `on line 3`. And from this point variable `s` will stop pointing to the same object of `value`.

On `line 2` variable `s` and `value` block parameter are still pointing to the same string object `hello` an we mutate the object concatenating `<<` on `s` variable
and the object is, at this point `helloxyz`

On `line 3` we can see that we reassign the variable `value` to the same object but upcased with a non destructive metod `upcase` on variable `value` to the reference string object `hello`, thn we will have a new string object `HELLO` assigned to value  , `upcase` who upcases each character inside the string.

On `line 4` even `concat` that is destructive, concatenate in this case the string object `!` but only to inner scope object referenced by `value`.

inside the string object. As `value` and `s` in this case stop pointing to the same
object and the return value is different.

`on line 8` variables `t` is pointing to the string object `HELLO!` and `s` keeps
pointing to the string object `hello`

*2. The concept we demostrate here is **Variables as pointers and pass a argument by reference**:*

*** 2 and half extra min from 7!

</br>
</details>
</br>

4. What does the following code return? What does it output? Why? What concept does it
demostrate?
**What values do `s` and `t` have? Why?**

```ruby .numberLines
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

<details>
<summary>Answer</summary>

</br>

*1. What values do `s` and `t` have? Why?*

On `line 6` the variable `s` is initialized to the string object `hello`
On `line 7` we initialize variable `t` to the return value of the method `fix` and pass variable `s` as an argument
As the method is defined `on line 1-4`.

Variable `s` will be assigned to the string object `HELLO!` and variable `t` will be pointing to the string object `HELLO!`

The reason is the reassigment `on line 3` nrmally variable `s` will stop pointing to the same object of `value` but in this case, the reassgiment is refrencing to the
destructive method `upcase!` on `s` pointing to the same string object `hello` that
at this point still the same the object.

On `line 4` we have the method `concat` that is destructive, on the object referenced by `s` and `value`, we will concatenate in this case the string object `!` and t object will be mutated as the same string object `HELLO!`

`on line 8` variables `s` and `t` is pointing to the same string object `HELLO!`.

*2. The concept we demostrate here is **Variables as pointers and pass a argument by reference**:*

* the method returns the last expression inside the method definition(evaluated).

</br>
</details>
</br>


5. What does the following code return? What does it output? Why? What concept does it demostrate?
**What values do `s` and `t` have? Why?**

```ruby .numberLines
def fix(value)
 value[1] = 'x'
 value
end

s = 'abc'
t = fix(s)
```

<details>
<summary>Answer</summary>

</br>

*1. What values do `s` and `t` have? Why?*

On `line 6` the variable `s` is initialized and assigned to the string object `abc`
On `line 8` we call the method `fix` and we pass variable `s` as an argument
As the method is defined `on line 1-4`. Variable `s` will be assigned to the string object `axc` and variable `t` will be pointing to the same string object `axc`

The reason is the destructive method index reassigment `on line 2`, `s` pointing to the same string object `abc` that at this point still the same the object referenced by `value`. We only mutate the string object `at index 1` in this case we change
the character `b` to `x` then `value` and `s` are still pointing to the same object.

`on line 8` variables `s` and `t` is pointing to the same string object `axc``.

* the return value of a method is the last line, in this case `value` who's pointing to the same string object `axc`

*2. The concept we demostrate here is **Variables as pointers and pass a argument by reference**:*

*** 2 and half extra min from 7!

</br>
</details>
</br>


6. What does the following code return? What does it output? Why? What concept does it
demostrate?

```ruby .numberLines
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*

on `line 8` value `a` will return and output `hello world`


*2. The concept we demostrate here is **Variables as pointers and pass a argument by reference**:*


*3. Explanation about the concept (why?):*
on line `1-3` we define `a_method` and we pass the parameter `string`
on line `2` we use the destructive method `<<` on  local variable `string`
passing a the string object ` world` on it.
With concatenate method `<<` we add in the end of the string the ` world` mutating the object.

on `line 5` we initialize the object string `hello`
on `line 6` we call the method `a_method` and we pass as an argument `a`. From this  moment variable `a` and  variable `string` are referencing to the same object.
As we use a destructive method `a` and `string` will be pointing to the same object until the end.

</br>
</details>
</br>


7. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
num = 3

num = 2 * num
```
<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 3` the variable `num` will be pointing to the inmutable object integer `6`

*2. The concept we demostrate here is **Variables as pointers in inmmutable objects**:*


*3. Explanation about the concept (why?):*
on `line 1` we initialize the variable `num` to integer `3`
on `line 3` we reassign `num` variable to the return value of the method `*` on
integer 2 passing as an argument the variable `num` on that moment referencing to  integer  object `3`.
multiplication method will return the product of integer `2` multiplied by `3` and will return the object `6`. all integers in ruby are inmmutable. It means that we can't change the object id and will
each of the integers will always point to the same object in memory that will allways be different to each other.
</br>
</details>
</br>



8. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
a = %w(a b c)
a[1] = '-'
p a
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*

On `line 3` we call `p` method and we pass as an argument the variable `a` that refers to the array
object. In this case the output/return is `['a', '_', 'c']`

*2. The concept we demostrate here is **Variables as pointers and object mutation with index assigment**:*


*3. Explanation about the concept (why?):*
On `line 1` we are initializing a local variable `a` assigned to an array collection with object integers with values `a` `b` and `c` on it.
as we use the destructive method of `index assigment`(`[]=`) we mutate the array elemtn at `index[1]`
`b` in this case and we reassign it to `_`. the object assigned to `a` will still be the same.

</br>
</details>
</br>



9. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On line `6` we are calling the method `add_name` and passing in the variable `names` and the
object integer `jim`  as an argument to it. As we do inside the method a reassigment and we use
a non destructive method `+` we know it will not mutate any og the passing arguments.
The return value is.`['bob', 'jim', 'kim']`

On `line 7` we call the method `puts` and passing in a local variable `names` to it as an argument.
the retun value is `nil` and the output is `'bob' \n 'kim'`

*2. The concept we demostrate here is **method calling with arguments and pass an argument by value**:*

*3. Explanation about the concept (why?):*
On lines `1-3` we are defining the method `add_name` which takes 2 parameters.
On `line 2` we reassign the local variable `arr` to itself adding the secong parameter as an array.
We can deduce by the variable name and composition that the first param will be an array anmd the second a string with a name.

</br>
</details>
</br>


10. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output? why?*
On line `6` we are calling the method `add_name` and passing in the variable `names` and the
object integer `jim`  as an argument to it. As we do inside the method a reassigment and we use
a the destructive method `<<` on `arr` Array object passing as an argument `name` variable. concatenate `['bob', 'kim']` with `'jim'` mutating the array.
The return value is.`['bob', 'jim', 'kim']`

On `line 7` we call the method `puts` and passing in a local variable `names` to it as an argument.
the retun value is `nil` and the output is `'bob' \n 'kim' \n 'jim'` as we mutate the array and
even we reassign `arr` on `line 2` this reassigment is to the same object mutated. So then we are still reffering to the same object.

*2. The concept we demostrate here is **method calling with arguments and pass an argument by reference**:*

</br>
</details>
</br>

#### Each, Map, Select
1. What does the following code return? What does it output? Why? What concept does it 	demonstrate?
```ruby .numberLines
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```
<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
The return value in this case will be on `line 5` there the block ends and it will
be a new empty `array` object `[]` as we use puts method and each element returns
`nil`

*2. The concept we demostrate here is **how works select method and thruthiness**:*

*3. Explanation about the concept (why?):*
On `line 5` we have the end of the block passed as an argument to `select` method.
This returns a new array object. Each of the elements of `array` variable on `select`
are passed inside the block as `num` and the return value `truthiness`, in case the
return value evaluates to`true` the value of the element is selected and passed to the new array.

* In ruby everything is `truthy` (evaluates to `true`) except `false` and `nil`.

*** I used 3 extra min than the expected!
</br>
</details>
</br>

2. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
The return value in this case will be on `line 3` there the block ends  with `}` and it returns a new  `array` object `[1, 3, 5, 7, 9]`.

*2. The concept we demostrate here is **how works select method and thruthiness**:*

*3. Explanation about the concept (why?):*
On `line 3` we have the end of the block passed as an argument to `select` method.
This returns a new array object. Each of the elements of `array` variable on `select`
are passed inside the block as `num` and the return value `truthiness`, in case the
return value evaluates to`true` the value of the element is selected and passed to the new array. In this case we use `odd?` method on each of the integers and it will return
`true` for the odd integers and include the elements on the new returned array.

* In ruby everything is `truthy` (evaluates to `true`) except `false` and `nil`.

*** I used 3 extra min than the expected!
</br>
</details>
</br>


3. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array
```
<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
The return value in this case will be on `line 5` when we use the method `p` it ouput and returns a new `array` object  with the identical elements as the previus array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

*2. The concept we demostrate here is **how works select method and thruthiness**:*

*3. Explanation about the concept (why?):*
On `line 5` we have the end of the block passed as an argument to `select` method.
This returns a new array object. Each of the elements of `array` variable on `select`
are passed inside the block as `num` and the return value `truthiness`, in case the
return value evaluates to`true` the value of the element is selected and passed to the new array. In this case we use `odd?` method on each of the integers and it will return
`true` for the odd integers and include the elements on the new returned array.

In this case `on line` the return value of each of the elements is evaluating to `true`
this is why all elements are selected and passed to the new array.

* In ruby everything is `truthy` (evaluates to `true`) except `false` and `nil`.

</br>
</details>
</br>

4. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
  puts n
end
p new_array
```
<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
The return value in this case will be on `line 7` when we use the method `p` it ouput and returns a new `array` object `[]`.

*2. The concept we demostrate here is **how works select method and thruthiness**:*

*3. Explanation about the concept (why?):*
On `line 6` we have the end of the block passed as an argument to `select` method.
This returns a new array object. Each of the elements of `array` variable on `select`
are passed inside the block as `num` and the return value `truthiness`, in case the
return value evaluates to`true` the value of the element is selected and passed to the new array.

In this case `on line 5` as we call the `puts` method and we pass as an argument each
of the elements represented by `n` and the return value is `nil` for each of the elements all evaluate to `false`, so any of the elements will be selected and it
will return a new empty array.

* In ruby everything is `truthy` (evaluates to `true`) except `false` and `nil`.

</br>
</details>
</br>

5. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```
<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 7` we call the method `p` this method inspects the object passed as an argument
in this case `new_array` that references an array object and output and returns `[false, true, false, false, true]`

*2. The concept we demostrate here is **how works the method `map` and how a new array is created with map transformation**:*

*3. Explanation about the concept (why?):*
On `line 3` we initialize `new_array` to the return value of the method `map` on the variable `words` that references
to an array collection with string elements. On the same time, we pass as an argument a `do..end` block with `word`
as block parameter.
On `line 4` isnide the block we use the method `start_with?` on `word` passing the objec string `'t'` as argument.
It will return `true` when the first character of the string is the letter `t` and false otherwise. `map` transforms
each of the elements returning the return value of the block and creating anew array with the same size of the original array.

*** I took 2 extra minutes more than expected.


</br>
</details>
</br>


6. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 3` it returns the original array passed as caller `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

*2. The concept we demostrate here is **how works the method `each` and how it ignores the return value of the block**:*

*3. Explanation about the concept (why?):*
On `line 1` we initialize the local variable `arr` and we assign it to an array collection of integers from 1 to 10.
On `line 3` we call `each` method on `arr` and we pass a block `{..}` with `n` as block parameter and we call
the `puts` method passing as argument `n` the method `each` iterates each alement passing it intio the block, the block will return `nil` in each iteration, but `each` method ignores the return value of the block and it will always return
the original array.

</br>
</details>
</br>


7. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
            n + 1
            end
p incremented
```
<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*

On `line 6` we call the method `p` ans we pass as an argument `incremented` variable that references an array.
the pethod `p` inspect the object passed as an agrument and  it returns and on the same time ouputs `[ 2, 3, 4, 5, 6, 7, 8, 9, 11]`


*2. The concept we demostrate here is **how works the method `map` and how it returns and can tranform the return value of the block into a new array**:*

*3. Explanation about the concept (why?):*
On `line 3` we initialize the value `incremented` and we assign it to the return value of the method map on `arr`
with a `do..end` block  as an argument. On the same line but nside the block we initialize a block parameter `n`.
On `line 4` we use `+` operator on `n` passing as an argument the integer `1` and we transform the block with the return value passing each of the elements as `n` and creating a new array with this retrun value.

</br>
</details>
</br>

8. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
end
p new_array
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 6` we call the method `p` and we pass as an argument the local variable `new_array`
that is refering to the an array collection.
`p` method `inspect` the passed object as an argument and output/return the object itself, in this case
`[false, true, true, true, true, true, true, true, true, true, true ]`

*2. The concept we demostrate here is **how works the method `map` and how it returns and can tranform the return value of the block into a new array**:*

*3. Explanation about the concept (why?):*
On `line 3` we initialize the local variable `new_array` to the return value of the method `map` on the variable `arr`
assigned to an array object with elements as integers `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. on the same line we pass as an argument a `do..end` block with block parameter `n`.
On `line 4` we call the conditioal operator `>` on `n` and we pass as an argument the integer `1`.
This will return a boolean, eeach of the elements of the collection bigger than `1` will return `true` otherwiase `false`. The return value is a collection of booleans. `map` takes the return value of the block from each element and creates a new array from it.

</br>
</details>
</br>

9. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
  puts n
end
p new_array
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 3`  we initialize `new_array` to the return value of the method `map` on the object collection that variable `arr` is assigned `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On the same line we pass as an argument a `do..end` block with block parameter `n`.
on `line 5` inside the block we call the method `puts` and we pass as an argument `n`.
As `map`is called on the array object and it returns a new array object populated with the return values of the block in each iteration.  The method `map` transforms the original array based on the return value of the block in each iteration.
For this reason `line 7` as we use `p` method that inspects the object passed as argument, in this case `new_array`
value that references to the array collection, it outputs and returns `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`.

*2. The concept we demostrate here is **how works the method `map` and how it returns and can tranform the return value of the block into a new array**:*


</br>
</details>
</br>

10. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
a = "hello"

[1, 2, 3].map { |num| a }
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we initialize the variable `a` to `"hello"`

On `line 3` we call the method `map` on an array collection of integers from `1 to 3` and we pass as an argument
a `{}` block with `num` as block parameter. Inside the block we pass the variable `a` who is pointing to the object `"hello"`, fot this reason the return value it will be a new array `['hello', 'hello', 'hello']`

*2. The concept we demostrate here is **how works the method `map`, and also that the lucal variable initialized outside the block can be accesed inside (but not biceversa) how it returns and can tranform the return value of the block into a new array**:*

*** just 6 min!
</br>
</details>
</br>

<!-- Example 10
What does the following code return? What does it output? Why? What concept does it demonstrate?


Example 11
What does the following code return? What does it output? Why? What concept does it demonstrate?

 -->

11. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby .numberLines
[1, 2, 3].each do |num|
  puts num
end
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we call the method `each` on the array collection `[1,2,3]` passing a `do..end` block as an argument. Inside the block we defined a block parameter `num` and we call puts method passing `num` as an argument.
The method `each` iterates on each of the elements and return the object caller `[1, 2, 3]` ignoring the return value of the block and outputs each of the elements as `1 \n 2 \n 3` where `\n` are the jumping lines in between.

*2. The concept we demostrate here is **how works the method `each` how returns the caller and ignores the return value of the block***

*** just 6 min!
</br>
</details>
</br>


#### Other Collection Methods
1. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
[1, 2, 3].any? do |num|
  num > 2
end
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we call the method `any?` on the array collection `[1, 2, 3]` and we pass as an argument a `do..end` block with the block parameter `num`.

On `line 2` inside the block we use the operator (greater than) `>` comparing each of the passing elements `1,2` and `3`
to `2` .
The method `any?` evaluates to true/false the return value of the block and it returns `true` and stops evaluating if any  of the elements returns `true`.
In this case the last element `3` is greater than 2, then the return value of the block will be `true`.

*2. The concept we demostrate here is **how works the method `any?` and  always returns a boolean if any of the return values of the block returns evaluates to `true`*

</br>
</details>
</br>

2. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we call the method `any?` on a hash collection `{ a: "ant", b: "bear", c: "cat" }.` and we pass as an argument a `do..end` block with the block parameters `key` and `value`.

On `line 2` inside the block we use the operator (greater than) `>` calling the method `size` on each of the `values` that will return the size as an integer to comper it to `4`.

The method `any?` evaluates to true/false the return value of the block and it returns `true` and stops evaluating if any  of the elements returns `true`.
In this case no any of the size values return a number greater than `4`, then the return value of the block will be `false`.

*2. The concept we demostrate here is **how works the method `any?` and  always returns a boolean if any of the return values of the block returns evaluates to `true`*

</br>
</details>
</br>

3. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
[1, 2, 3].all? do |num|
  num > 2
end
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we call the method `all?` on the array collection `[1, 2, 3]` passing as an argument a `do..end` block
with block parameter `num`.
On `line 2` we call the operator (greater than) `>` comparing each of the caracters to the integer `2`.
`all?` method evaluate to true/false the return value of the block. And returns true only if all of the elements return `true`, otherwise will return `false`.
In this case the last element `1` is not greater than `2` then `all?` will stop evaluating and for this reason it will return `false`.

*2. The concept we demostrate here is **how works the method `all?` and  always returns a boolean if all of the return values of the block returns evaluates to `true`*

</br>
</details>
</br>

4. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we call the method `all?` on the hash collection `{ a: "ant", b: "bear", c: "cat" }` passing as an argument a `do..end` block with block parameters `key` and `value` representing each `keys` and `values` of the collection.
On `line 2` we call the operator (greater equal than) `>=` calling the method `length` on each value) and compare it to the integer `3`.

`all?` method evaluate to true/false the return value of the block. And returns true only if all of the elements return `true`, otherwise will return `false`.
In this case all value sizes are greater equal than 3 then `all?` and all the return values of the block will return `true`. For this reason `all?` method will return `true`.

*2. The concept we demostrate here is **how works the method `all?` and  always returns a boolean if all of the return values of the block returns evaluates to `true`*

</br>
</details>
</br>


5. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we call the method `each_with_index` on an array collection of integers `[1, 2, 3]` passing as an argument
a `do..end` block with  `num` and `index` as parameters.

On `line 2` we call the method `puts` passing as an argument a string `with` num and `index` using string interpolation.

As `each_with_index` is using `each` method but on the same time `index` the first block parameter will be each element
of the array iteration and the second parameter `index` it will be the index each element is at. `each_with_index` ignores the return value of the block and int always returns the object caller.
For this reason the output will be:
`The index of 1 is 0.`
`The index of 2 is 1.`
`The index of 3 is 2.`
And the will return `[1, 2, 3]`

*2. The concept we demostrate here is: **how works the method `each_with_index` and how ignores the return value of the block an returns the caller object***

</br>
</details>
</br>


6.  What does the following code return? What does it output? Why? What concept does it demonstrate?


```ruby .numberLines
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we call the method `each_with_object` on an hash collection of integers `{ a: "ant", b: "bear", c: "cat" }` passing as an argument an empty array `[]` and a `do..end` block with  `pair` and `array` as block parameters.
where `pair` is each value-pair of the collection and `array` is the empty initialized array.
What method `each_with_object` does is taking the first parameter initialized as the last block parameter (`array` in this case)
and return this new object.

On `line 2` we call the method `last` taking the last value of the pair (in this case are each value of each element) and with the destructive method `<<` we concatenate each of the elements into the initialized array obejct.
For this reason, the return value of `each_with_object` is `["ant", "bear", "cat"]`

*2. The concept we demostrate here is: **how works the method `each_with_object` and how ignores the return value of the block an returns the new object initialized as first agrument***

** 1 minute and half more as expected.

</br>
</details>
</br>


7. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we call the method `each_with_object` on an hash collection of integers `{ a: "ant", b: "bear", c: "cat" }` passing as an argument an empty hash `{}` and a `do..end` block with  `key`, `value` and `hash` as block parameters.
where ``key`, `value`` are each value-pair of the collection and `hash` is the empty initialized hash.
What method `each_with_object` does is taking the first parameter initialized as the last block parameter (`hash` in this case) and return this new object.

On `line 2` we call the index reassigment method `=[]` passing each value as index and returning and assign it to the each specific key.
For this reason, the return value of `each_with_object` is `{ a: "ant", b: "bear", c: "cat" }`

*2. The concept we demostrate here is: **how works the method `each_with_object` and how ignores the return value of the block an returns the new object initialized as first agrument***

** 1 minute more as expected.
</br>
</details>
</br>

8. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
odd, even, other= [0,1, 2, 3].partition do |num|
  num.odd?
end

p odd
p even
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*
On `line 1` we initialize on one line the variables `odd` and `even` to
the return value of the merthod `partiton` on  an array `[1, 2, 3]` passing
as argument a `do..end` block with `num` as block parameter.
The metod `partition` returns 2 new arrays, the first one with the block returns
that evaluate to `true` and the second with the rest of values(the ones that evaluates to `false`).
On `line 2` we call the method `odd?` on `num` that represents each element of the iteration. In case the number is odd it will be placed on the first variable `odd`
who's pointing to a new array object, otherwise will be placed in the new array object assigned to variable `even`.

For this reason we have as return and ouput(as we us `p` method that inspects the object passed as argument and it return/outputs the result)
On `line 5` return/output: `[1,3]`
On `line 6` return/outout: `[2]`

*2. The concept we demostrate here is: **how works the method `partition` creating 2 news arrays, the first with the `truthy` return values of the block and the secon with the `falsey` return values of the block.***

** 3 minutes more as expected!
</br>
</details>
</br>

Truthiness
1. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

<details>
<summary>Answer</summary>

</br>

*1.  What does the following code return? What does it output?*

*2. The concept we demostrate here is: **..***

</br>
</details>
</br>


#### Bonus problems


1. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)

```

<details>
<summary>Answer</summary>

</br>

On `line 5` we initialize variable `a` to an array collection of integers `['a', 'b', 'c']`.

On `line 6` we call the method test and we pass as an argument the variable a that references to an array object.

On `line 1-3` we have the method definition. On `line 1` we define `test` method and we pass as parameter the variable `b`. As variable `a` is passed as an argument, in this moment, variable `a` and `b` point to the same object.

On `line 2` we call map non-destructive method on `b` passing as parameter a `{}` block as an argument and as a block parameter `letter`. On the same line we have a string object with `letter` as string interpolation, each element will be passed as "I like the letter: `a`, `b`, `c` respectively. We don't have an output. As `map` is the last line inside the method, it will be the return value and it returns a new array object with the block return value of each iteration:
For this reason the return value `on line 6` is:
`["I like the letter: a", "I like the letter: b", "I like the letter: c"]`

We demonstrate the next concepts:
* How we need to define a parameter to pass a local variable to a method.
* How it works `map` and how always returns a new array without mutating the object.
* The return value of a method call is the last line that can be returned inside the method.

</br>
</details>
</br>