**Question 1**

In this hash of people and their age,

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```
see if "Spot" is present.
>ages.key?("Spot")

Bonus: What are two other hash methods that would work just as well for this solution?

> ages.include?("Spot")
> ages.member?("Spot")


**Question 2**
Starting with this string:

```ruby
munsters_description = "The Munsters are creepy in a good way."
```
Convert the string in the following ways (code will be executed on original munsters_description above):

```ruby
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

>```ruby
>munsters_description.upcase..swapcase!
> munsters_description.gsub('Munsters','munsters').capitalize!
>munsters_description.downcase
>munsters_description.upcase
>```


**Question 3**
We have most of the Munster family in our age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```
add ages for Marilyn and Spot to the existing hash


```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

>```ruby
>ages.merge!(additional_ages)
>```

**Question 4**
See if the name "Dino" appears in the string below:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
> `advice.include?("Dino")`
> `advice.match?("Dino")`

**Question 5**
Show an easier way to write this array:

```ruby
flintstones2 = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]`
```

>flintstones = %w(Fred Berney Wilma Betty BamBam Pebbels)

**Question 6**
How can we add the family pet "Dino" to our usual array:

> `flintstones << "Dino"`

**Question 7**
In the previous practice problem we added Dino to our array like this:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```

We could have used either Array#concat or Array#push to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)

>```ruby
> flintstones.push("Dino","Hoppy")
> flintstones.push("Dino").push("Hoppy")
flintstones.concat(%w(Dino Hoppy)) 
>```


**Question 8**
Shorten this sentence:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
...remove everything starting from "house".

Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the String#slice method instead?

> ` advice.slice!(0, advice.index('house'))`
>It returns the delimitations but it saves in the array the from the non returning part.
> ` advice.slice(0, advice.index('house'))`
> using the slice method will not save mutate the array we will just return the delimitation from 0 to 29("Few things in life are as important as .")


**Question 9**
Write a one-liner to count the number of lower-case 't' characters in the following string:


`statement = "The Flintstones Rock!"`

> `statement.count('t')`

**Question 10**

Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

`title = "Flintstone Family Members"`

>`title.center(40)`