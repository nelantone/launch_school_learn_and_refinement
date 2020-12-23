
1. **describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:**

what is != and where should you use it?
it means `not equal` we will use it as opposite as equal comparing as `unless`
we will be able to write `unless a == 1` or `if a != 1`

put ! before something, like !user_name
> not user_name it's tπhe same as `unless user_name`

put ! after something, like words.uniq!
> in this case it means we will use #uniq destructive method variation `uniq!` will mutate the object with the result of uniq obkect elements inside an array vs `uniq`.

put ? before something
> only before and nothing after will raise an exception.
> before and after it is a ternary operator
>```ruby
> 2+2 == 4 ? puts true : puts false
>```

put ? after something
> it might be a specific method that returns a boolean. For example:
>```ruby
> [].empty? #=> true`
> ```

put !! before something, like !!user_name
> we can check the truthy or falsey of a object whtout using conditionals.
>this is  doble negation !(not)!not.
>```ruby
> true! # (not true) => false
> true!! #(not false ) => true
>```


**2. Replace the word "important" with "urgent" in this string:**

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
> ```ruby
> advice.gsub!('important','urgent')
> ```


3. **The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:**

numbers = [1, 2, 3, 4, 5]

What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
> in this case delete_at passed to numbers is related about the index in this possition `numbers[1]` it will remove `2` from `numbers`.

numbers.delete(1)
> calling delete with `1` as argument on numbers will remove the
object with value `1` in this case the first it will be the same as `numbers.delete_at(0)`.
Both methods are destructive (it will mutate/modify the array object).


4. **Programmatically determine if 42 lies between 10 and 100.**
```ruby
(10..100).include? 42
#or
(10..100).cover? 42
```

Note:
In Ruby, whenever we are evaluating if an object **lies** inside a range, we can use  `cover?` to ask Ruby to figure it out logically using the lower and upper limit; rather than using `include?` which would instantiate each element of the range and then perform the evaluation on each instance of the range.

Using: include?
```ruby
(1..10).include?(7)      # true
Compares to performing all these evaluations:

1 == 7     # false
2 == 7     # false
3 == 7     # false
4 == 7     # false
5 == 7     # false
6 == 7     # false
7 == 7     # true
```

Using: cover?
```ruby
(1..10).cover?(7)      # true

Compares to performing this single evaluation:

7 >= 1 && 7 <= 10      # true
```
cover? has performance advantages on large ranges or on more complex objects; like Date objects.

```ruby
t = Time.now
('aaaaaa'..'zzzzzz').cover?('zombie')
puts Time.now - t
# => 1.1e-05

t = Time.now
('aaaaaa'..'zzzzzz').include?('zombie') 
puts Time.now - t
# => 78.468679
```

But sadly we can’t always rely on cover?

```ruby
('a'..'z').cover?('dog')
# => true
('a'..'z').include?('dog')
# => false
```

cover? uses comparison, so it is true that 'a' >= 'dog' and 'dog' <= 'z'. If we check the items, we can verify that 'dog' isn’t included:

sources: 
https://fabianuribe.com/blog/ruby-cover.html
http://www.albertoalmagro.com/ruby-rangeinclude-vs-rangecover/

**5. Starting with the string:**

`famous_words = "seven years ago..."`

**6. show two different ways to put the expected "Four score and " in front of it.**

>```ruby
>"Four score and " + famous_words
>"Four score and ".prepend(famous_words)
>"Four score and " << famous_words
>```


**7. If we build an array like this:**

```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```
**We will end up with this "nested" array:**

```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
Make this into an un-nested array.
```

>```ruby
> flinstones.flattern! #destructive
> flinstones.flattern #not destructive
>```


**7. Given the hash below**

```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```

**Turn this into an array containing only two elements: Barney's name and Barney's number**

```ruby
 flintstones.select { |key| key.eql? "Barney" }
#or
flintstones.assoc("Barney")
```