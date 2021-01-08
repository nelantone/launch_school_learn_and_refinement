**Practice Problem 1**
What is the return value of the select method below? Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```


<details><summary>Answer</summary>

select method returns the last line inside the block evaluating the truthiness of this return.
In this case as the last line inside the block is `'hi'` string and string is truthy
(not nil and not false), so will be true for each object inside the collection and  it will return `[1,2,3]`

***
*select performs selection based on the truthiness of the block's return value. In this case the return value will always be 'hi', which is a "truthy" value. Therefore select will return a new array containing all of the elements in the original array.*
***
</details>
<br>

**Practice Problem 2**
How does count treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

<details><summary>Answer</summary>

We can take a look in the ruby documentation.
In my case I like to use it directly in my terminal as `ri -i` then I look first if the method is par of the `Enumerable` class and in this case it is, then `Enumerable#count`.
In the documentation:
> Returns the number of items in enum through enumeration.
> If a block is given, it counts the number of elements **yielding a true value**.
R-Doc example:
```ruby
ary = [1, 2, 4, 2]
ary.count{ |x| x%2==0 } #=> 3
```

In our case, there are two items smaller than 4 `'ant', 'bat'` then, as it is `true` in two cases, it will return `2`.

***
*if we don't know how count treats the block's return value, then we should consult the docs for Array#count. Our answer is in the description:*

> ***If a block is given, counts the number of elements for which the block returns a true value.***

*Based on this information, we can conclude that count only counts an element if the block's return value evaluates to true. This means that count considers the truthiness of the block's return value.*
***
</details>
<br>

**Practice Problem 3**
What is the return value of reject in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

<details><summary>Answer</summary>

We can take a look in the ruby documentation.

But as I am familiar with `#reject` method I can tell that will only include what returns falsey.
In our case we return `nil` so the return will be `[1,2,3]` and the output will be `1\n2\n3\n`
In any case as I am not sure if it is an array returning I will check the documentation.
> Returns an array for all elements of enum for which the given block returns false.

`(1..10).reject { |i|  i % 3 == 0 }   #=> [1, 2, 4, 5, 7, 8, 10]`

yes it returns an array.

***

`# => [1, 2, 3]`
*Since puts always returns nil, you might think that no values would be selected and an empty array would be returned. The important thing to be aware of here is how reject treats the return value of the block. reject returns a new array containing items where the block's return value is "falsey". In other words, if the return value was false or nil the element would be selected.*
***
</details>
<br>


**Practice Problem 4**
What is the return value of each_with_object in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```
<details><summary>Answer</summary>

`#each_with_object` method it is quite particular.
first it takes one argument, this argument is the return collection or data structure we will return.
then in this case we are calling the method in an array collection and we have a block with two block arguments `value` and `hash`, as it is with the names
the first block argument it is the value in each iteration and the second argument it
is the initialized element in the argument.

Inside the block we are defining a hash key with the first leter inside the current iteration value so, in the first iteration `value[0]` is `"ant"[0]= a`... And so on.

it will return
> `{'a'=>'ant', 'b'=>'bear', 'c'=> 'cat'}`

***

`# => { "a" => "ant", "b" => "bear", "c" => "cat" }`

*Based on our knowledge of each, it might be reasonable to think that each_with_object returns the original collection. That isn't the case, though. When we invoke each_with_object, we pass in an object ({} here) as an argument. That object is then passed into the block and its updated value is returned at the end of each iteration. Once each_with_object has iterated over the calling collection, it returns the initially given object, which now contains all of the updates.*

*In this code, we start with the hash object, {}. On the first iteration, we add "a" => "ant" to the hash. On the second, we add "b" => "bear", and on the last iteration, we add "c" => "cat". Thus, #each_with_object in this example returns a hash with those 3 elements.*

***
</details>
<br>


**Practice Problem 5**
What does shift do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

<details><summary>Answer</summary>
In ruby documentation:

`Hash#shift`
>  Removes a key-value pair from hsh and returns it as the two-item
array [ key, value ], or the hash's default value if the hash is empty.

```ruby
  h = { 1 => "a", 2 => "b", 3 => "c" }
  h.shift   #=> [1, "a"]
  h         #=> {2=>"b", 3=>"c"}
```

If I understud well, we will have the first key,value as an array pair and will mutate the object removing the first `key,value` from the hash.

in our case:

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift # [:a, 'ant']
hash # => {b: 'bear'}
```

***

*`shift` destructively removes the first key-value pair in hash and returns it as a two-item array. If we didn't already know how shift worked, we could easily learn by checking the docs for Hash#shift. The description for this method confirms our understanding:*

> *Removes a key-value pair from hsh and returns it as the two-item array [ key, value ], or the hash’s default value if the hash is empty.*

*There are quite a few Ruby methods, and you're not expected to know them all. That's why knowing how to read the Ruby documentation is so important. If you don't know how a method works you can always check the docs.*

***
</details>
<br>

**Practice Problem 6** *

What is the return value of the following statement? Why?

`['ant', 'bear', 'caterpillar'].pop.size`

<details><summary>Answer</summary>
We are calling 2 different methods on an array object.
By parts:

`Array#pop` will remove the last object inside the collection, it is a destructive method, it means that the object will be removed but the object array is the same.
The return it is the removed item.

As it is a chained method we have now "catepillar" as return and will call the next method inside of.Then:
`String#size` it returns the size of the string as an integer.

this will return

`['ant', 'bear', 'caterpillar'].pop.size # => 11`

***

`# => 11`
*There are a couple things going on here. First, pop is being called on the array. pop destructively removes the last element from the calling array and returns it. Second, size is being called on the return value by pop. Once we realize that size is evaluating the return value of pop (which is "caterpillar") then the final return value of 11 should make sense.*

***
</details>
<br>

**Practice Problem 7**

What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

<details><summary>Answer</summary>

`Array#any?` is iterating in each object and it returns the last line of the block
, when some of the items is truthy with the condition, it will return `true` and **will output the first item in the collection(it is only invoked once because we raise the true condition on the first item, otherwise we will have the rest of items until it raise the first truthy condition (short circuit behaviour) )** *.

In this case
```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# 1 => true
```
***
*The return value of the block is determined by the return value of the last expression within the block. In this case the last statement evaluated is num.odd?, which returns a boolean. Therefore the block's return value will be a boolean, since Integer#odd? can only return true or false.*

*Since the Array#any? method returns true if the block ever returns a value other than false or nil, and the block returns true on the first iteration, we know that any? will return true. What is also interesting here is any? stops iterating after this point since there is no need to evaluate the remaining items in the array; therefore, puts num is only ever invoked for the first item in the array: 1.*
***
</details>
</br>

**Practice Problem 8**

How does take work? Is it destructive? How can we find out?

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

<details><summary>Answer</summary>

I used before `Array#take` if I remember well, it takes the n items starting from `index[0]` or from the first that in this case is 1.
So will take the first two items of the array and will return them into a new array
I don't think this method is destructive.

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2) # => [1,2]
arr # => [1, 2, 3, 4, 5]
```

`#take` is not destructive, the best way to find out is trying directly on `pry/irb`.

it means that creates a new array with the result and is not mutating the actual array.

To make it destuctive we can use `#slice!` in case we want the same array as before but destructive:

```ruby
arr = [1, 2, 3, 4, 5]
arr.slice!(0,2) # => [1,2]
arr # => [3, 4, 5]
```
**
Actually `Array#slice(0,2)` is the same as `Array#take(2)`


***

*If you're unsure of how a method works the best thing to do is to read its documentation. Along with that, testing the method in irb can be very helpful. In this case we can quickly check if take is destructive or not by running the code in irb.*

```ruby
irb :001 > arr = [1, 2, 3, 4, 5]
irb :002 > arr.take(2)
=> [1, 2]
irb :003 > arr
=> [1, 2, 3, 4, 5]
```

*By reading the docs and testing the method in irb, we're able to determine that Array#take selects a specified number of elements from an array. We're also able to verify that it isn't a destructive method.*

***
</details>
</br>

**Practice Problem 9**

What is the return value of map in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

<details><summary>Answer</summary>

`=> [ nil, 'bear'] `

`Enumerator#map` returns an array with the last return line of the code.
First iteration is false, then value is nil. second value is true then
we return the value itself.


***

`# => [nil, "bear"]`
*There are some interesting things to point out here. First, the return value of map is an array, which is the collection type that map always returns. Second, where did that nil come from? If we look at the if condition (value.size > 3), we'll notice that it evaluates to true when the length of value is greater than 3. In this case, the only value with a length greater than 3 is 'bear'. This means that for the first element, 'ant', the condition evaluates to false and value isn't returned.*

*When none of the conditions in an if statement evaluates as true, the if statement itself returns nil. That's why we see nil as the first element in the returned array.*

***

</details>
</br>

**Practice Problem 10**

What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

<details><summary>Answer</summary>

`Enumerable#map` is iterating each object inside the collection and transforming and returning last line inside a block of each element in a new array.

in this case.
`2\n 3\n => [1, nil, nil]` as first object is smaller/equal than 1 will return `1`
the other two elements are outputing `2` and `3` but returning nil
***
*We can determine the block's return value by looking at the return value of the last statement evaluated within the block. In this case it's a bit tricky because of the if statement. For the first element, the if condition evaluates to false, which means num is the block's return value for that iteration. For the rest of the elements in the array, num > 1 evaluates to true, which means puts num is the last statement evaluated, which in turn, means that the block's return value is nil for those iterations.*

Therefore, the return value of map is:

`# => [1, nil, nil]`

***
</details>