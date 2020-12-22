
**Question 1**
What do you expect to happen when the greeting variable is referenced in the last line of the code below?

```ruby
if false
  greeting = "hello world"
end

greeting
```

<details>
<summary>Answer</summary>

`greeting` will return `nil`

conditional operators in ruby as `if`, `else`, `eslif` are  keeping the normal execution of the flow and are not separate scopes. Even if a branch is not executed, a variable initialized within it is still available to the program, although its value will be `nil`

*greeting is nil here, and no "undefined method or local variable" exception is thrown. Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it’s undefined. However, when you initialize a local variable within an if block, even if that if block doesn’t get executed, the local variable is initialized to nil.*

</details>
</br>

**Question 2**

What is the result of the last line in the code below?

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```

<details>
<summary>Answer</summary>

The last line will print `{ a: 'hi' }` anr return `nil`

when we initialize `informal_greeting` and assign to `greetings[:a]`
`greetings[:a]` and `informal_greeting` will point to the same object in memory.
on next line when we append via `#<<` destructive operator we are mutating the object keeping the same object_id. Then the the objet will be `hi there` for
`greetings[:a]` and `informal_greeting` as are still pointing to the same object.
in case we we reassign `informal_greeting` or/and we use a method as `#+=` then
informal greetings will point to another place in memory and greetings will not
mutate and will keep is original value.

*The output is {:a=>"hi there"}. The reason is because informal_greeting is a reference to the original object. The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it. This means that the original object was changed, thereby impacting the value in greetings. If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings, there are a couple of options:*

*we could initialize informal_greeting with a reference to a new object containing the same value by informal_greeting = greetings[:a].clone.
we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object.*

</details>
</br>


**Question 3**
In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?

A)

```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

```
<details>
<summary>Answer</summary>

It is a better practice to change argument names, then it is more clear.
the arguments are different variables as `one`,`two`,`three` when we pass
them to a method they point to the same object first. Once inside penends
what we do with this variables. In this case.

```ruby
def mess_with_vars(a, b, c)
  a = b #as we reassign `a` then will point to different place in memory of "one"
  b = c #as we reassign `b` then will point to different place in memory of "two"
  c = a #as we reassign `c` then will point to different place in memory of "three"
end
```
mess_with_vars(one, two, three)#>>=> "two" #as `a` is reassigned with `b` and `b` 
is `"two"`.

In the end as the arguments and variables are no longer pointing to the same object
nothing will change in the outer scope.

one is: one
two is: two
three is: three

</details>
</br>


B)
```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
<details>
<summary>Answer</summary>

`mess_with_vars(one, two, three)`>>=> "one"

Same case as above. We are reassigning each of the argument variables.

one is: one
two is: two
three is: three

</details>
</br>

C)
```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
<details>
<summary>Answer</summary>

As we use a destructive method as `#gsub!` we are mutating the object
and `one` as argument and `one` as variable are pointing to the same object.
Same for `two` and `three` then will be all modified.

one is: two
two is: three
three is: one
</details>
</br>


**Question 4** *
Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

<details>
<summary>Answer</summary>
*
There are several ways to fix this. To determine if there are exactly 4 dot-separated "words" in the string, you can simply add a check for dot_separated_words.size after splitting the string.*

*The other error in Ben's code is that instead of returning false upon encountering a non-numeric component, he used break to break out of the while loop. Once he breaks, control falls through to the return true statement. He can fix this by performing return false instead of break.*


```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
```

*Note: Ben's original return true on the last line of the method can be shortened to just true. This is because Ruby returns the result of the last evaluated expression.*

</details>
</br>