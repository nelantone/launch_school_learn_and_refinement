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



######Rewritte!
we call the method length on each stirng object that the value references/assigns to. # as an argument inside the block not as parameter#


<!-- Enumerable#all?
all? functions in a similar way to any?. It also looks at the truthiness of the block's return value, but the method only returns true if the block's return value in every iteration is truthy (that is, not false or nil). -->
