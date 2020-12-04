# problem 1

```ruby
def speak(speech)
  speech.capitalize!
  speech.concat(' World')
  speech + "!"
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
>> =>:speak
7: intialize speech to 'hello' string

9: we invoke speak method passing `speech` as argument and retuns 'Hello World!'
>>=>'Hello World!'
11: we display speech variable.
>>Hello => nil

What concept does it demonstrate?
The first concept that demostrates is scope in methods and variables as pointers:
speech is pointing to 'hello'
once we pass the argument string inside the method we invoke to destructive methods
#concat & #capitalize! is a string and the methods are destructive
but points to the same fisical place in memory these 2 consecutive times.
the las method #+ is not destuctive so will point to the same object_id as the line before(speech.concat)

The second concept is the mutation of a variable inside a method (variable passed by reference)
#concat & #capitalize! it mutates the object itself but #+ not(the sope of this change will only inside the block)

The third concept is side effects
when we define a method we need to be sure that is only one side effect, or we full mutate the variable and we return the mutation
or we display the non mutation and don't mutate the variable/argument.
In this case we mutate the variable/argument and on the same time we return a different value as the one we save. This can be confusing.




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
3: closing method
>> => :speech
5: calling my_speech variable
>> NameError: undefined method or name my_speech

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
1: intitializing name constant pointing to 'Bob' string
3: defining a loop with a iteration of 5 times and staring a block with
`name` as block argument
4: try to reasign name to another string, from the block argument first iteration?
for the initialized variable outside? name variable will not be reassigned because
tuby protects the outer sope variable when we give the sanem name to the block argument
thi iteration will be 5 times doing the same reassigment.
5: close loop
>> =>5
7: we want to use the #p method to inspec name value
>> 'Bob' => 'Bob'

What concept does it demonstrate?
It demostrates the concept of variables shadowing.
When we call the block parameter the same way as an initialized variable outside the block
ruby will protect or outer sope variable and will not let use it inside the block
this is a bad practice, we should call our block param different as other initialized variables



# Bonus problems
# problem 1 / bonus 1
```ruby
def speak(speech)
  speech.capitalize!
  speech.concat(' World')
  speech << "!"
end

speech = "hello"

speak(speech)

puts speech
```
1: we start a speak method with one parameter
2: we invoke capitalize destructive method on the caller
3: we invoke concat destrucive method passing a 'world' argument wi
4: we append "destructive and mutating the object itself" with method #<< inside the string
5: close method
>> =>:speak
7: intialize speech to 'hello' string

9: we invoke speak method passing `speech` as argument and retuns 'Hello World!'
>>=>'Hello World!'
11: we display speech variable.
>>Hello World! => nil

What concept does it demonstrate?

The first concept that demostrates is scope in methods and variables as pointers:
speech is pointing to 'hello'
once we pass the argument string inside the method we invoke to destructive methods
#concat & #capitalize! is a string and the methods are destructive
but points to the same fisical place in memory these 2 consecutive times.
the las method #<< is destructive and mutates the object itself (it works as if we reassign the variable).
So will not point to the same object_id as the line before(speech.concat) we can see this adding #object_id before #<<
and after.

# problem 2 / bonus 1
```ruby
def speech()
  my_speech = "Welcome to Launch School!"
end

puts my_speech
```

What does the following code return? What does it output? Why?
1: we define a method speech whithout parameter defined
2: initialized inner scope variable pinting to a string
3: closing method
>> => :speech
5: calling my_speech variable
>> NameError: undefined method or name my_speech

What concept does it demonstrate?
It demostrate the variable scope concept.
We can only access inner scope variables inside a block/method


# problem 2 / bonus 2
```ruby
speech_3 = nil
def speech_3(speech_3)
  speech_3 = "Welcome to Launch School!"
end

puts speech_3
p speech_3(speech_3)
p self.speech_3
```

1: init variable speech_3 to nil
2: define speech_3 variable with speech_3 parameter
3: reassign speech_3 pointing to another string
4: close method
>> => speech_3
6: invoke/call variable speech_3
>>   => nil
7: invoke/call method speech_3 with speech_3 argument
>> "Welcome to Launch School!"
8: invoke/call speech_3 method whithout argument and rasising error
>> ArgumentErrror.. 0 wrong number of arguments(given0, expected 1)


# problem 2 / bonus 3
```ruby
def speech_3
  speech_3 = "Welcome to Launch School!"
end

p speech_3
speech_3 = "Hello"
p speech_3
self.speech_3
```
1: init variable speech_3 to nil
2: define speech_3 variable with speech_3 parameter
3: reassign speech_3 pointing to another string
4: close method
>> => speech_3
5: we invoke the speech_3 method, it return 'Welcome to Launch School'
>> => Welcome to Launch School
6: We initialize speech_3 with 'hello' string
>>=> 'Hello'
7: we inspect with #p the variable speech_3
>>"Hello" => "Hello"
8: invoke/call method speech_3 with #self.:method
>>=>"Welcome to Launch School!"