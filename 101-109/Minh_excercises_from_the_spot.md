# problem 1

```ruby
def speak(speech)
  speech.capitalize!
  puts speech.concat(' World')
  puts speech + "!"
end

speech = "hello"

speak(speech)

puts speech
```
What does the following code return? What does it output? Why?
1: we start a speak method with one parameter

2: we invoke capitalize destructive method on the caller

3: we invoke concat destrucive method passing a 'world' argument wi

4: we add '!' with +(concatenation) method inside the string

5: close method

\>> =>:speak

7: intialize speech to 'hello' string


9: we invoke speak method passing `speech` as argument and retuns 'Hello World!'

\>>=>'Hello World!'

11: we display speech variable.

\>>Hello World=> nil

What concept does it demonstrate?

The first concept that demostrates is scope in methods and variables as pointers:
speech is pointing to 'hello'
once we pass the argument string inside the method we invoke to destructive methods
#concat & #capitalize! is a string and the methods are destructive
but points to the same fisical place in memory these 2 consecutive times.
the las method #+ is not destuctive and will not point to the same object_id as the line before(speech.concat)
as example:

speech.object_id
\>>=> 1880

(speech.concat('!')).object_id
\>>=>1880

(speech + '!').object_id
\>>=> 1900


The second concept is the mutation of a variable inside a method (variable passed by reference)
#concat & #capitalize! it mutates the object itself but #+ not(the sope of this change will only inside the block)

The third concept is side effects
when we define a method we need to be sure that is only one side effect, or we full mutate the object that variable/parameter is pointing and we return the object mutation or we display the non mutation and don't mutate the object.
In this specific case we mutate the objects that variables/parameters are pointing and on the same time we return a new object. This can be confusing.
a new object not value, because variables point to objects and do not hold values while objects have values.


# problem 2

```ruby
def speech()
  my_speech = "Welcome to Launch School!"
end

puts my_speech
```

What does the following code return? What does it output? Why?

1: we define a method speech whithout parameter defined

2: initialized inner scope variable pinting to a string

3: closing method. The method = assigned the string "Welcome to Launch School!" to the variable my_speech and at the same time returns it as well. Since it is the last line, the string object was also the return value of the method speech.

\>> => :speech

5: calling my_speech variable

\>> NameError: undefined method or name my_speech

What concept does it demonstrate?

It demostrate the variable scope concept.
We can only access inner scope variables inside a block/method.



# problem 3
```ruby
name = 'Bob'

5.times do |name|
  name = 'Bill'
end

p name
```

What does the following code return? What does it output? Why?

1: intitializing name pointing to 'Bob' string

3: defining a loop with a iteration of 5 times and passing `name` as parameter defined by the block. The argument that is passed to the block is a numeric value in each iteration. That passes those argument method times.

4: try to reasign name to another string, from the block argument first iteration?
for the initialized variable outside? name variable will not be reassigned because
tuby protects the outer sope variable when we give the sanem name to the block argument
thi iteration will be 5 times doing the same reassigment.

5: close loop

\>> =>5

7: we want to use the #p method to inspec name value

\>> 'Bob' => 'Bob'

What concept does it demonstrate?

It demostrates the concept of variables shadowing.
When we call the block parameter the same way as an initialized variable outside the block
ruby will protect or outer sope variable and will not let use it inside the block
this is a bad practice, we should call our block param different as other initialized variables



# Bonus problem

# bonus from problem 2
```ruby
speech = "Hello"
p speech

def speech
  speech = "Welcome to Launch School!"
end

p speech
self.speech
p speech()
```
What does the following code return? What does it output? Why?

1: intialize variable speech pointing to "Hello" string

2: invoke metho #p to inspect speech

\>>"Hello" => "Hello"

4: start/define method speech

5: initialize speech variable inside the method with an array

6: close the method

\>>=>:speech

8: invoke #p variable to speech variable.

*Because we have a method and variable with the same, this is a bad practice. It will be printed the variable.

\>>"Hello"=>"Hello"

9: call #self method to speech method

*As we call self. it's clear that we want to acces the method and not the variable

\>>=>"Welcome to Launch School!"

10: call #p method speech()

*Same as before. Is a way to call a method to differenciate it from a variable

\>>"Welcome to Launch School!"=>"Welcome to Launch School!"


What concept does it demonstrate?

The concepts that demostrates is the precedence.
Normally we will think that, because speech method is initialized later the variable. when we will call
`speech` it will return the method as "Welcome to Launch School!" as the flow is this way from the last
initialized/defined variable.
In this case the precedence is more important. Ruby will give precedence to the variable speech,
probably because as we see in the last two lines we can call the `speech` method in two different ways.
