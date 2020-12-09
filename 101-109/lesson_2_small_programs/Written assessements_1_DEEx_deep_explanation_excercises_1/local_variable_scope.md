https://github.com/14jdelap/launch_school/blob/master/teaching_lessons/rb101/variables/local_variable_scope.md

# What do the following code blocks return?
# What does it output?
# Why?
# What concept does it demonstrate?


```ruby
a = ‘Hello’
b = a
a = 'Goodbye'
```

What do the following code blocks return? What does it output?
8: >> => Error
9: >> => nil
10: >> => 'Goodbye'
Why?
8: intitialize a with a grave accent. But we will raise an exception as is not single quote
because of the rasising exception, the variable `a` it is initialized to nil.
9: initialize b with a as value. but we couldn't initialize properly a
 when this happens and we raise an error the variable is initialized with nil by default.
 this is the reason why `b` is also `nil`
10: we reassign `a` with `'Goodbye'` string

note > a > => 'Goodbye' ; > b > => nil

What concept does it demonstrate?
Demostrates the concept of variable as pointer.
when we initialize a variable we point the variable to a place in memory.
when we reassign one variable to another one both variables will point to the same object_id
by definition this is a place in memory `a = b`.
```ruby
a.object_id == b.object_id
# >> =>true
```
when we reassign `a` with another value as `b`, `a = 'Goodbye'` the variable stops pointing
to the same target as `b` a will point to another space in memory this time with a string
and b will continue pointing to `nil` because it hasn`t been mutated.
```ruby
a.object_id == b.object_id
# >> =>false
```

```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```
# What do the following code blocks return?
# What does it output?
# Why?
line 45: initialize `a` with a number
`>> 4`
line 47: we start a loop
line 48: we reassign the loop in the inner scope
line 49: we initialize the variable b in the inner scope
line 50: we break/exit the loop
line 51: >> nil
line 53: we print value `a` equal to 5
`>>5`
line 54: we raise an exception because   b is initialized inside the loop
`NameError: undefined local variable or method...`
# What concept does it demonstrate?
Demostrate outer/innerscope concept, we can initialize and use variables in the outerscope also in the inner scope
but we can only initialize inner scope variables and use them inside the scope.

"This code illustrates that local variables can be accessed within a leaky scope if they've been defined outside of it, but inversely a local variable defined within a *leaky* scope can't be accessed in an outer scope."

~leaky scope: alcance de la fuga/filtración: Este código ilustra que se puede acceder a las variables locales dentro de un ámbito de fuga/filtración si se han definido fuera de él.

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
puts c
```

- What do the following code blocks return?
- What does it output?
- Why?
line 76: we initialize local variable a pointing to 4
line 78: we initialize local varible b pointing to 2
line 79: we start a loop bock
line 80: we initialize on the inner scope of the block variable c pointing to 3
line 81: we reassign variable a from outer scope pointing to c
line 82: we break/exit the loop/block
line 85: we print > a > 3 => nil
         variable a is reassigned inside the block, initialized outer scope variables can be accessed inner scope.
line 86: we print > b > 2 => nil
line 87: We raise an exception NameError..
         variables initialized inside a block/inner-scope can't be accessed outside.

- What concept does it demonstrate?
The concept that demostrates is the inner scope and outer variable initialization.
Outer scope we can access initialized variables outside and inside a block, inside scope we can only access in the block.
We also demostrate the concept of variables as pointers, in ruby the variables while initializing are pointing to a place
in memory, when we reassign the variable this place in memory change as `a` but in this case `c` still pointing to the
same object as the initial variable .

Short version answer:
This code illustrates the idea of variables as pointers and stress tests it with variable assignments in inner and outer loops.

The key idea is shown within the loop: c is initialized and assigned to 3, and a is then reassigned to c. Yet as c points to 3, it's essentially binding a to 3.

Thus, puts a outputs 3 and returns nil and puts b outputs 2 and returns nil


```ruby
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

the concept we want to demostrate si the loop, this loops needs to have a `break` statement to to avoid infinite looping.
line 123: we initialized a variable
line 127: we used as descreases the number each time the loop passes removing -1 from the total until i == 0
line 128: we break/exit the loop.
line 131: we invoke/call the method example passing a `hello` string as an argument.
return:
>> hello
hello
hello
=> nil

**
```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)
```
this code ilustrates the concept of side effects within methods.
line 154: >> Hello \n Goodbye => nil
What is a side effect? When the method does something else besides returning a value.

```ruby
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
What do the following code blocks return?
What does it output?
Why?

163: initialize var array collection of numbers from 1 to 4
165: initialize var counter pointing to 0
166: initialize var sum pointing to 0

168: start a loop block
169: redefining sum variable inside the block adding `arr[0]` in this case
value is `1`.
170: counter is redifined as `0+1` shortcut of `counter = counter + 1`
169-170: loop iterations
171: we add the break/exit conditional, when the counter is equal the array size.
1. sum = 0 + 1, counter = 1 ? ;counter == arr.size => false
2. sum = 1 + 2, counter = 2 ? ;counter == arr.size => false
3. sum = 3 + 3, counter = 3 ? ;counter == arr.size => false
3. sum = 6 + 4, counter = 4 ? ;counter == arr.size => true / exit loop

174: we invoke the variable with a string interpolation:
>> "your total sum is  6" => nil

What concept does it demonstrate?
- inner/outer scope, when we initialize a variable outside a block we can use it
inside and we can mutate the value.
**
This illustrates the concept of iterating through a collection to get the sum of all of its elements (as, e.g., inject).

sum is reassigned in each iteration to sum = sum + arr[counter], and it coveres all values by increasing the counter by 1 in each iteration.

**
The iteration avoids an error by breaking when the counter is equal to the number of elements in arr

```ruby
a = 'Bob'

5.times do #|x|
  a = 'Bill'
end

p a
```

What do the following code blocks return?
What does it output?
Why?

209: intialize `a` pointing to 'bob' value as a string
212: start a 5.times loop with block with an argument name of |x|
213: we reassign variable a pointing to bill and we reassign it 5 times.
214: later the 5 times we exit the block, the return value of the times block is
the number of times, in these case `5`
>> => 5
216: we use p method to inspect and print/return the value a
>> 'Bill' => 'Bill'

What concept does it demonstrate?
It demostrates the inner scope varabile, once initialized outside we can access inside the block.
Also shows the iteration concept, and that we don't need to initialize |x|(argumentt name)
it will work the same way as

```ruby
5.times do |x|
  a = 'Bill'
end
```

** in resume:
This illustrates i) variable reassignment within an inner scope and ii) passing a do...end block to a method.

```ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```
What do the following code blocks return?
What does it output?
Why?

250: reassign animal variable to cat
251: initialize local variable inside the block
252: break the loop inmediately in the first iteration
255: will print "cat" and retul nil
>> cat => nil
256: Will raise an exception as Errorname
>> Errorname

What concept does it demonstrate?
Demostrates the concept of variable scope, initializing a variable inside a block
will not be reachable outscope. But outside scope variable is reachable inside and outside.

** other words
This code illustrates variable scope within inner and outer scopes.

As animal is initialized in the outer scope, it can be reassigned within the loop and called by puts outside of it (which outputs cat). Contrarily, var is initialized within the loop so can't be accessed outside of it.

100% socre in anticipating return and side effect values!



