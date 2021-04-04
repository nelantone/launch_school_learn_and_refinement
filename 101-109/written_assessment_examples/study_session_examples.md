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

2. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby .numberLines
 def fix(value)
   value = value.upcase
   value.concat('!')
 end

 s = n
 t = fix(s)
```
<details>
<summary>Answer</summary>

</br>
 On `line 6` we initialize local variable `s` to `"hello"`.
 On `line 7`  we initialize `t` to the return value of `fix` method.

 On line `x` we are calling the method `fix` and passing in the string `s` as an argument to it. `value` and `s` are pointing to the same string object.

  On `line 2` variable `value` and `s` no longer point to the same string object so it is no longer possible to mutate the object that points to.

 On `line 178` the return value is `HELLO!` there is no output.

 * We also can see that This method acts like pass by value but in ruby all methods are passed by reference-value.

 * We also demostrate the concept of variables as pointers, and
 that when we reassign a variable stops pointing to the same object and to pass a local variable inside a method as an agrument.
</br>
</details>
</br>

4. What does this output and return, and what concept does this demonstrate?
```ruby .numberLines
[1, 2, 3].all? do |num|
  num > 2
end
```

<details>
<summary>Answer</summary>

</br>

On `line 1` we call the method `all?` on an array collection `[1, 2, 3]` passing as an argument a `do..end` block
with variable `num` as block parameter.

On `line 2` in side the block the argument `num` references to each integer element and we use the operator `>` to compare each element to with the integer `2`.

The method `all?` evaluates the truthiness of the return value of the block on each iteration, and `all?` method returns `true` when all return values of the block are `true` otherwise returns `false`.

For this reason the return value of `all?` is `false` as the first element `1` is not greater than  `2`.

* The concept that we demostrate is thruthiness. **In Ruby everything evaluates to `true` extept `false` and `nil`**
* `all?` method stops evaluating the rest of the elements when finds out the first *falsey* element, then the return of the block is `false` and `all?` returns `false`.

***(8 and half min) 1 and half min more as expected.

</br>
</details>
</br>

5. What does this output and return, and what concept does this demonstrate?
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
On `line 4` we initialize the local variable `a` to the integer `3`
On `line 5` we initialize the local variable `b` to the return value of the method `plus` passing `a` that references integer `3` and integer `2` as arguments.

From line `1-3` we have the method definition of `plus` passing as parameters `x` and `y`.
When we call the method `plus` on `line 5` as we pass `a` and `b` as arguments then. `a` and `x` will reference to the same object `3`, `y` will reference to `2`.

As are arguments/parameters ar pointing to `integers` we know this method will not mutate any of the objects because all integers are inmutable.

On `line 2` we reassign `x` to the return value of  the method `+` on `x`(3) passing as an argument  `2`.
For this reason (3+2) will return `5` and as is the last possible return line, the method returns `5`.

And on line `6` and `7` the retun value as we call `puts` passing `a` and `b` as arguments will be `nil` and
the return values will be:
On `line 6`: `3`
On `line 7`: `5`

* The concept that demostrates is string inmutability. How to pass a local variable into a method and how ruby acts like passing by value (but ruby always pass the objects by reference-value).

</br>
</details>
</br>

6. What does this output and return, and what concept does this demonstrate?
```ruby .numberLines
arr = ['10', '11', '9', '7', '8']
sorted =  arr.sort do |a,b|
  a.to_i <=> b.to_i
end
p sorted
```

<details>
<summary>Answer</summary>

</br>
On `line 1` we initialize the variable `arr` to an array collection `['10', '11', '9', '7', '8']`.

On `line 2` we initialize the variable `sorted` to the return method of the method `sort` on `arr` assigned to `['10', '11', '9', '7', '8']`, that, on the same line we pass a `do..end` block with two block parameters `a` and `b`.

On `line 3` within the block, we use the spaceship operator `<=>` on the call `to_i` method on `b` and passing as an argument the call method `to_i` on `a` (convertin both objects into integers).
When we compare with sort we compare as example and first iteration.
`10` <=> `11` as `10` is smallet than `11`, the retun value of the block is `-1`
and as `b` is before `a` we will sort it from greater to smaller.

On `line 6` we call the method `p` that returns and outputs the inspect version os the object. For this reason the output and return value of `sorted` is
`["11", "10", "9", "8", "7"]`.

The concept that demostrates is how method `sort` works and how `<=>` compares and returns `-1` when the left object is smaller, `0` when both are equal, and `1` when the left object is greater.

*** 3 more minutes as expected! (10min)

* It is imporant to mention that `sort` returns an array containing the same items sorted (double check this).
</br>
</details>
</br>

7. What would output be here for arr1 and arr2? And why?
```ruby .numberLines
arr1 = ["a", "b", "c"]
arr2 = []
arr1.each {|x| arr2 << x.dup}
arr2.map! do |char|
  char.upcase
end

puts arr1
puts arr2

```
<details>
<summary>Answer</summary>

On `line 1` we initialize the local variable `arr1` to an array collection`["A", "b", "c"]`.
On `line 2` we initialize the local variable `arr2` to an empty array `[]`.

On `line 3` we call the method `each` on `arr1` referencing the object `["A", "b", "c"]` passing a `{..}` block as an argument. Inside the block we defined a block parameter `x` and we call puts method passing `x` pointing to each string object that the value references to. On the same line within the block we have the method `dup` that produces a shallow copy the object, the instance variables of obj are copied, but not the objects they reference.

On `line 4` the destructive method `map!` is called on the array object and it returns the same object populated with the return values of the block in each iteration. The method `map` transforms mutating the original array based on the return value of the block in each iteration. In this case we upcase each element with the method  `upcase`.

For this reason the output is:

- On `line 6`  we call the method `puts` passing **`arr1`** as argument, which **outputs the string `"a"  "b" "c"`** and returns `nil`
- On `line 7`  we call the method `puts` passing **`arr2`** as argument, which **outputs the string `"A" "B" "C"`** and returns `nil`


</br>



</br>
</details>
</br>

8. What return value of both of these iteration methods?
```ruby .numberLines

[1, 2, 3].any? do |num|
  num > 2
end

[1, 2, 3].all? do |num|
  num > 2
end
```
<details>
<summary>Answer</summary>

</br>

On `line 1` we call the method `any?` on the array collection `[1, 2, 3]` and we pass as an argument a `do..end` block with the block parameter `num`.

On `line 2` inside the block we use the operator (greater than) `>` comparing each of the passing elements that `num` is pointing (`1,2` and `3`) to `2` .
looks at the truthiness of the block's return value in order to determine what the method's return value will be.

If the block returns a *"truthy"* value for any element in the collection, then the method `any?` returns `true` otherwise returns `false`.
In this case the last element `3` is greater than `2`, the return value of the block will be `true`, for this reason and in this case, **the method `any?` return value is `true`**

The concept we demostrate here is **how works the method `any?` and  always returns a boolean if any of the return values of the block returns evaluates to `true`*

On `line 1` we call the method `all?` on the array collection `[1, 2, 3]` passing as an argument a `do..end` block
with block parameter `num`.

On `line 2` we call the operator (greater than) `>` comparing each of the caracters to the integer `2`.
`all?` method evaluate to true/false the return value of the block. And returns true only if all of the elements return `true`, otherwise will return `false`.

In this case the last element `1` is not greater than `2` then `all?` will stop evaluating and for this reason, the **return value of `all?` is `false`.**

The concept we demostrate here is **how works the method `all?` and  always returns a boolean if all of the return values of the block evaluates to `true`*


</br>
</details>
</br>


9. What does this output and why?

```ruby .numberLines
name = 'MF Doom'

loop do |name|
   name = 'Madlib'
   break
end
puts name
```
<details>
<summary>Answer</summary>

</br>

On `line 1` we initialize the local variable `name` to `'MF Doom'`.

On `line 3` we call the loop method passing in the `do..end` block as an argument with a block parameter
`name`.

On `line 4` we initialize another local variable `name` to `'Madlib'`.

When we had a variable named in the outer scope(n) as  the block parameter |n| as in this case `name`.

We'd essentially have two local variables in the inner scope with the same name.

Ruby variable shadowing prevents us from making changes to the outer scoped `name`.
On the same time we can access num inner scope variable inside.

**We want to avoid variable shadowing**, as it's almost never what you intended to do.

On `line 6` we call the method `puts` which outputs the string version of the passed object as argument that `name` points at. For this reason the **output is `"MF Doom"`** and returns `nil`.

</br>
</details>
</br>

10. What will the output be on line 7?
```ruby .numberLines
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
On `line 5`  we initialize the local variable `names` to an array collection `['bob', 'kim']`.

On `line 1` we call the method `add_name` and we pass `names` and `'jim'`, name local variable as an argument on it. On the definition `add_name(arr, name)` the variable `arr` used as parameter is referencing to the same object string as the variable `names`.
From this moment on, `arr` and `names` are pointing to the same object and `name` is pointing to `"jim"`.


On `lines 1-3` we are defining the method `add_name` which takes 2 parameters.
On `line 2`  we reassign `arr` to the return value of the destructive method push`<<` to concat an object as one element on the array collection `arr` passing as an argument the variable `'jim'`.
Because we are pointing to the same object on in the return value, it does not matters the reassigment.

On `line 7`  we call the method `puts` which outputs the string version of the passed object as argument that `names` points at. For this reason, the **output value is:**
**`bob`**
**`kim`**
**`jim`.**
And returns `nil`.


The concept we demostrate here is **Variables as Pointers**.
Variables are pointers to physical space in memory. In other words, variables are essentially labels we create to refer to some physical memory address in our computer.
 Some operations mutate the address space in memory.  Ruby *acts like*
`pass by reference` for *mutable objects*.

* `\` are the jumping lines in the output.

<details>
<summary>Answer</summary>

</br>


</br>
</details>
</br>

11. What will the output be on line 7?
```ruby .numberLines
 def fix(value)
   value = value.upcase!
   value.concat('!')
 end

 s = "n"
 t = fix(s)
```
<details>
<summary>Answer</summary>

</br>

On `line 6` we initialize the local variable `a` to `4`.

On `line 7`  we initialize the local variable `t` to the return value of the method `fix` passing the string `s` as an argument to it. `s` and `value` are pointing to the same string object. On `lines 1-5` we are defining the method `fix` which takes 1 parameter `value`.

On `line 2` the local variable `value` is reassigned to the return value of the destructive method `uppercase!` on `value`. Nevertheless, as we reassign the object `"n"` to itself and we are just mutating the object, `s` and `value` still pointing to the same object.

On `line 8` call the destructive method push to append object as one element on the array collection `value` passing as an argument the variable `"!"`. Here also `s` and `value` are pointing to the again mutated object.

The concept we demostrate here is **Variables as Pointers**.
Variables are pointers to physical space in memory. In other words, variables are essentially labels we create to refer to some physical memory address in our computer.
Some operations mutate the address space in memory.  Ruby acts like `pass by reference` for *mutable objects*.

**For this reason the return value on `line 7` is `N!`**
</br>
</details>
</br>


12. Are `arr1` and `arr2` are referencing the same object? And each of the elements? Why?
```ruby .numberLines
arr1 = ["A", "b", "c"]
arr2 = []
arr1.each {|x| arr2 << x.dup}
arr2.map! do |char|
  char.upcase!
end

puts arr1
puts arr2
```

<details>
<summary>Answer</summary>
On `line 1` we initialize the local variable `arr1` to `["A", "b", "c"]`.
On `line 2` we initialize the local variable `arr2` to  an empty array `[]`.
On `line 3` we are calling the `each` method on `arr1` and passing a `{..}` block as an argument with a block parameter `x`. Within the block we call the method `<<` on `arr2` pointing to `[]` and passing as an argument the method `dup` on `x` that points to each string object that the value references to.
the method `dup` produces a shallow copy of the object, the instance variables of the object are copied, but not the objects they reference.**

**For this reason the `arr1` and `arr2` are referencing to a different object and each element inside the collection is also referencing to a different object.**

arr1.object_id # 740
arr2.object_id # 760
p arr1[0].object_id # 720
p arr2[0].object_id # 700

Also we can see on the las lines the different ouput we have and also how the destructive method `upcase` returns `nil` on the first element as `upcase!` does when the character is already upcased.
# => nil
`A`
`b`
`c`
# => nil
` ` # because is `nil`
`B`
`C`

</br>
</details>
</br>

13. Are `arr1` and `arr2` are referencing the same object? And each of the elements? Why?
```ruby .numberLines
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

On `line 1` we initialize the local variable `arr1` to an array collection `["A", "b", "c"]`.

On `line 2` we initialize the local variable `arr2` to the return value of the method `dup` on `arr1` that points to `["A", "b", "c"]`. `dup` produces a shallow copy of the object, the instance variables of the object are copied, but not the objects they reference.

On `line 4` the destructive method `map!` is called on the array object and it returns the mutated object with the return values of the block in each iteration. In this case we upcase each element with the non-destructive method  `upcase`.

as `arr1` is a shallow copy of `arr2`, the instances inside are pointing to the same object but the variablies are pointing to a different array object.

So, in this case `arr2` will point to a different array object with upcased string elements `['A', 'B', 'C']` and local variable `arr2` will point to the same non mutated array object `["a", "b", "c"]`.

</br>
</details>
</br>

14. Are `arr1` and `arr2` are referencing the same object? And each of the elements? Why?
```ruby .numberLines
arr1 = ["A", "b", "c"]
arr2 = arr1.dup

arr2.map do |char|
  char.upcase!
end  # => [nil, "B", "C"]



puts arr1
puts arr2  # => ["A", "B", "C"] ?
```

<details>
<summary>Answer</summary>

On `line 1` we initialize the local variable `arr1` to an array collection `["A", "b", "c"]`.

On `line 2` we initialize the local variable `arr2` to the return value of the method `dup` on `arr1` that points to `["A", "b", "c"]`. `dup` produces a shallow copy of the object, the instance variables of the object are copied, but not the objects they reference.

On `line 4` the method `map`is called on the array object and it returns a new array object populated with the return values of the block in each iteration.  The method `map` transforms the original array based on the return value of the block in each iteration. In this case we upcase each element with the destructive method  `upcase!`.

For this reason **`arr1` and `arr2` are different objects, for the method `dup` definition, as have a different `object_id` and `arr1` is a shallow copy**.

Nevertheless **each of the elements inside the `arr1` and `arr2` have the same object_id and will be pointing to the same array.
again for the `dup` method definition.

We can see it calling:
arr2[0].object_id # => 360
arr1[0].object_id # => 360

</br>
</details>
</br>

