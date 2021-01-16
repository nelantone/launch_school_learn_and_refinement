**Spin Me Around In Circles**

You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

```ruby
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
```
<details><summary>Answer</summary>

As we know and our first impression it will be that as `reverse!` is a
destructive method, it will mutate the object.
Neverless approaching a step-by-step taking a look each method invoked in
the caller. In order.

```ruby
str = 'hello world' #caller
str.split #['hello', 'world']
```

As `split` is creating a new object, it stops pointing to the same place in memory.
So we know that whatever it happens later, it will not mutate the original object
`'hello'.reverse!` will not affect `"hello world"` initial object.

Another way to see it:

```ruby
str = 'hello world'
str.object_id # => 1820
str.split.object_id # => 1840
str.split.join.object_id # => 1860
```

So, when `reverse!` will mutate  the caller?
Imagine we have, instead an array as parameter.

```ruby
def spin_me(ary)
  ary.each do |word|
    word.reverse!
  end.join(' ')
end

first_internet_greeting = ['hello', 'world']
first_internet_greeting.object_id # => 1960

spin_me(first_internet_greeting) # => "olleh dlrow"
first_internet_greeting.object_id # => 1960
first_internet_greeting #=> ['olleh', 'dlrow']

first_internet_greeting.each { |greeting| greeting.reverse! }
first_internet_greeting.object_id # => 1960

first_internet_greeting.join(' ').object_id # => 1980
```

Interesting!
As we see `first_internet_greeting` never stopped pointing to the same object,
this is because we pass by reference the object inside the method.

but spin_me(first_internet_greeting) returns another object, because, as we see
in the documentation *"Returns a string created by converting each element of the array to a string"*.

It is always to take a look on the Ruby documentation.
When it says ***it creates a new x object*** normally means is non destructive.
when it says ***in place*** , ***itself*** or ***converting*** etc... It's clearly destructive.

How we can know which method is mutating the caller (pass by reference) and
when is returning a new object(pass by value)?

1. See if we pass mutable or inmutable object as an argument.
  if is **mutable** it can be by reference or value**
  if is **inmutable then it only can be by value** so it doesn't matter which
  method we will invoke on the caller, the object will be the same.
  (inmutable objects in ruby are numbers, symbols,  nil , true , false and few other objects...).

  A way to see if a object is inmuttable can be:

  ```ruby
  a = nil
  b = nil
  a.object_id == b.object_id
  ```

2. In case the object is mutable then we need to focus on the methods we pass.

  if all methods pass a destructive method (caller are mutating/modifing the caller) will be passing by reference and the object reference in the argument will be mutated

  if any of the methods mutate/modify the caller and instead we create a new object
  then we are passing by value and the object will not be mutated.

  and here is the hard one.
  if at some point we are using a destructive method before a nond destructive
  we will modify the caller. In the moment we pass one an only one non destructive method. the caller will stop pointing to the same initial object, and for then
  will only be modified inside the method.

 3. What happen if the objet is mutable and have a mixture of destructive and non-destructive methods?

  *Reminder that we only talk about mutable objects*
  In the moment **we invoke first a destructive method to** the **caller/argument**
  **before** a **non destructive** method(*reassiging is non destructive).
  We will say that **the argument is passed by reference**.

  In the moment that **we invoke first a non destructive method in the begining**, the **object referenced in**the **argument will stop pointing to the same initial variable** and then we are sure that  **the argument is passed by value**.


Very imporant! As this is very tricky to know and the most imporant lesson about
it is not to confuse you. This is a typical problem and very crucial.

because all of this, and avoiding these kind of problems, to me, **good practices are**.

1. When we mutate any of the caller-arguments inside a method be clear in the
  method name:
    for example naming the method `update_x`, `transform_y`, or adding `!` as ruby
    uses for many destructive methods.
  </br>

2. When we don't mutate any of the caller-arguments inside a method give a name
     as `print`, `return`, `total` etc...

  </br>

3. When you don't mutate try to don't use destructive methods to be clear on that:
    Then people will be less confused and will really know that the value will not be mutated.
  </br>

4. Avoid mutation(pass by refence) as much as possible. Better reassign the result
 to a variable otuside your method. Then you avoid problems in bigger projects and the future. This is more in the direction of functional programming.
 </br>

</details>
