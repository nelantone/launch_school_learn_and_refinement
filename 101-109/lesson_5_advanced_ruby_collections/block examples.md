### 5.4 Working with Blocks
Take your time to analyze each example in this assignment.  The goal is to have a deep understanding of how each detail works, not to complete this assignment as fast as possible.


#### Example 1

```ruby .numberLines
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```

<details>
<summary>Answer</summary>

|Line | Action | Object | Side-effect  | Return-value  | Return-val-used? |
|:--:  |:--     |:--     |:--           |:--            |               :--|
|1| **method call (`each`)** | **The** outer array `[[1, 2], [3, 4]]` | None | **The calling object** | No **, but shown on `line 6`** | outer array | depends on #puts on `line 2` | outer array | no
| 1-3 | **block execution** | **each sub-array** | **None** | **`nil`** | **No** |
|2| **method call (`#fist`)** | **Each sub-array** | None | **Element at index 0 of sub-array** | **yes, used by `#puts`**|
|2| method call (`#puts`) | **Element at index 0 of sub-array** | **outputs string representation of an Integer** | `nil` | ** **Yes, used to determine return value of block**|


** **puts returns nil and, since this is the last evaluated statement within the block, the return value of the block is therefore nil *but* each doesn't do anything with this returned value though**

</details>
</br>



#### Example 2
```ruby .numberLines
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```

<details><summary>Answer</summary>

|Line | Action | Object | Side-effect  | Return-value  | Return-val-used? |
|:--:  |:--     |:--     |:--           |:--            |               :--|
|1| method call (`#map`)| The outer Array |None | New Array `[nil,nil]` |No, but shown on `line 6`|
|1-3| Block execution| **Each sub-array** | **None** | `nil` | yes, **used by `map` for transformation** |
|2| method call (`#first`)| Each sub-array | None | **Element at index 0 of sub-array** | Yes, used by `#puts` |
|2| method call (`#puts`) | **Element at index 0 of each sub-array** | ***Outputs a string representation of an Integer***| `nil` | ***Yes, used to determine return value of block*** |
</details>

</br>

#### Example 3
```ruby .numberLines
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```
What do you think will be returned and what will be the side-effects?

<details><summary>Answer</summary>

This example will output and return the following:
```ruby .numberLines
# 1
# 3
# => [1, 3]
```
breaking down the example, paying close attention to:

* The return value of the block
* The return value of the method
* Any side-effects

|Line | Action | Object | Side-effect  | Return-value  | Return-val-used? |
|:--:  |:--     |:--     |:--           |:--            |               :--:|
|1| method call (`#map`)| The outer Array | None | ***New Array [`1` `3`]*** | No |
|1-4| Block execution | **Each sub-array**  | ***None*** | **Integer at index 0 of sub-array**  | **yes, used by `map` for** ***transformation*** |
|2| method call (`#first`) | Each sub-array | None | Integer at index 0 of sub-array | yes, **used** by `#puts` |
|3| method call ( `#puts`) | Integer at index 0 for each sub-array| **Outputs a string** ***representation*** **of an Integer** | `nil` | No |
|4| method call (`#first`) | Each sub-array | None | **Element** at index 0 of sub-array| ***Yes, used to determine the return value of block*** |
</details>

</br>

#### Example 4

```ruby .numberLines
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```


<details>
<summary>Answer</summary>

</br>
The value of `my_arr` will be the array that each was called on because `each` ignores the block's return value.

```ruby .numberLines
# 18
# 7
# 12
# => [[18, 7], [3, 12]]
```

|Line | Action | Object | Side-effect  | Return-value  | Return-val-used? |
|:--:  |:--     |:--     |:--           |:--            |               :--|
|1| **Variable assigment** | n/a | None | ***`[[18, 7], [3, 12]]`*** | No |
|1| method call (`#each`) | ***`[[18, 7], [3, 12]]`*** | None | ***The calling object: `[[18, 7], [3, 12]]`***|**Yes, used by variable assignment to my_arr** |
|1-7| Outer block execution | Each sub-array | None | ***Each sub Array*** *`?` | No |
|2| Method call (`each`) | Each sub-array | None | ***The calling object: sub-array in current iteration*** | ***Yes, used to determine return value of outer block*** *`?`|
|2-6| **Inner** block execution | ***Element** **of the sub-array in that iteration** | None | `nil` | No |
|3| ***comparison `>`***| **Element of the sub-array iteration** | None | ***Boolean*** | ***yes, evaluated by `if`*** |
|3-5| conditional (`if`) | ***The result of the expression `num > 5`***  | None | **`nil`** | ***Yes, used to determine return value of inner block***
|4| method call (`#puts`) | ***Element of the sub-array in that iteration*** | **Outputs a string representation of an Integer** | `nil` | **yes, used** ***to determine return value of the conditional statement if the condition is met*** |

</details>

#### Example 5
```ruby .numberLines
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```
<details>
<summary>Answer</summary>
*What output/returns?*

```ruby
# [[2, 4], [6, 8]]
```

|Line | Action | Object | Side-effect  | Return-value  | Return-val-used? |
|:--:  |:--     |:--     |:--           |:--            |               :--|
|1| method call (`#map`)| ***Original*** **Array** | None | **New** ***transformed*** **array** | No |
|1-5| ***Outer*** **block execution** | Each sub-array | None | ***New transformed array*** | **Yes, used by** ***top-level map for transformation*** |
| 2 |method call (`#map`)| Each sub-array | None | ***New transformed array*** | **Yes, used** ***to determine outer block's return value*** |
| 2-4| ***Inner*** **block execution** | ***Element with*** **each Subarray** | None | ***An integer*** | **Yes, used by** ***inner `#map` for transformation*** |
|3| **method call (`#*`)** ***with integer 2 as an argument*** | ***Element within each sub-array*** | None | ***An Integer***| **Yes, used** ***to determine return value of inner block*** |
</details>

#### Example 6
**6.1** Deconstruct this code to its core line by line without a table. What do you think will be returned/output?  **
```ruby .numberLines
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.any? do |key, value|
    value[0] == key.to_s
  end
end
```

**6.2** What would happen if, instead of using all?, we used any?. Why would this affect the return value of select?


<details>
<summary>Answer</summary>

**6.1**
return/output
```ruby
#=> [{c: "cat"}]
```
On `line 1` we have `#select` method call on a Array of 2 hash objects.

`#select` method evalutes the **truthiness** of the last line of the block return
value and creates a new transformed array from each thruthy value of the
collection(in this case hash collection).

</br>

From `line 1 to 5` we have a block with `hash` as a name parameter.

</br>

On `line 2` we have an `#all?` method call on each Element Hash.
`#all?` method verify a certain condition in this case defined inside the block and
returns `true` when all elements of the hash waranty the condition.

</br>

From `line 2 to 5 we have` a block execution  with `key`, `value` block parameters

</br>

On `line 3` we have method call `#to_s` on each key object of the hash iterations
creating a new string from the key-symbol and trying to  **match** with `#==` the string value to each related string object assigned to the `value` at index `[0]`.

</br>

In case all iterations are true will return true and will include the hash collection into the new Array with selected hashes that are truthy.

***Officital Answer 6.1:***
*The first thing to notice here is the use of the `all?` method within the `select` block. Since `#select` specifically cares about the `truthiness` of the **block's return value**, using a method that returns a boolean works well. `all?` will return true if the block passed to it never returns a value of false or nil for every `key/value` pair in the hash. We're using `value[0] == key.to_s` to test whether all keys **match** the first letter of all their associated values. Note that the only hash that **meets this criteria** is `{:c => 'cat'}`, and the return value is an array.*

**6.2**:
```ruby
# => [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]
```
When we use `#any?` method call instead `#all?`, the return value of the
new array will select also the first hash.
`#any?` method will return true in case as some of the comparisons inside  the
block are true. In other words *"`#any?` method
returns true if the block ever returns a value other than
false or nil"*.
</details>
</br>

#### Example 7

Given

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
```

**7.1** What is the return-value/output of.

```ruby
arr.sort
```

**7.2** What is the return-value/output of

```ruby
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```

**7.3** Are the same result? Why/why-not? Do you think that can be confusing?

<details>
<summary>Answer</summary>

**7.1**
```ruby
# => [['1', '8', '11'], ['1', '8', '9'], ['2', '12', '15'], ['2', '6', '13']]
```
As are strings inside an array an we compare by `<=>` spaceship operator the size.

We are sorting with the string.ord size starting from index at `0`
so `index at [0]`:
 ```ruby
 '1'.ord <=> '1'.ord # => 0
 '1'.ord <=> '2'.ord # => -1 # then '1'.ord are smaller and will be first
 '2'.ord <=> '2'.ord # => 0
 # so far we know this ['1'..], ['1'..], ['2'..], ['2'..]
 ```
`index at [1]`
```ruby
# based on ['1'...] and ['2'...]
# on ['1'] at index 1
'8'.ord <=> '8'.ord # => 0
# on ['2'] at index 1
'12'.ord <=> '6'.ord # => -1 ## Because 49 < 54  '12' is smaller :o...
# so far we know this ['1', '8', ..], ['1', '8', ..], ['2', '12', ..], ['2', '6'..]
```
index at [2]
```ruby
# based on ['1', '8'...]  and we can ignore ['2'..] as it is sorted.
'11'.ord <=> '9'.ord # => -1 ## Because 49 < 57 '11' is smaller than '9' :o...

#final result
# => [['1', '8', '11'], ['1', '8', '9'], ['2', '12', '15'], ['2', '6', '13']]

```
***Original answer***
*Because the elements in the arrays are strings, by calling sort it is string order which will ultimately determine array order:*

```ruby
arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]
```


**7.2**
```ruby
# => [ ['1', '8', '9'], ['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15']]
```
In this case we are sorting by integer size and not by integer as string representation.
Then.
```ruby
1 <=> 1  # => 0
1 <=> 2  # => -1
# ['1' ..], ['1'..], ['2'..], ['2'..]
8 <=> 8  # => 0
12 <=> 6 # => 1 ( 12 as integer greater than 6)
# ['1', '8', ..], ['1', '8', ..], ['2', '6', ..], ['2', '12'..]
11 <=> 9 # => +1
# => [ ['1', '8', '9'], ['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15']]
```
***Original Answer***
*Since strings are compared character by character this doesn't give us a numerical comparison. In order to achieve this we have to perform some transformation on the inner arrays prior to comparing them as above.*

*The key here is understanding that when we carry out transformation within a sort_by block, the transformed elements are what are then used to perform the comparison. As long as what is returned by the block is comparable, we can perform whatever transformation we need to within the block - including nesting other method calls within it.*

**7.3**
It's a different result because are different class objects 7.2 have more sense
unless that we need to sort by string-*asciibetical* order

***Original Answer***
*In the last case, each time the top-level block is called, we call map on the sub-array for that iteration, within the map block we call to_i on each string within that particular sub-array, which returns a new array with integers and leaves the original sub-array unmodified. This ends up sorting the outer array by comparing the transformed integers in the inner arrays, which is what we're looking to do, without any side effects.*
</details>

#### Example 8
```ruby .numberLines
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
```
What will be the return-value/output?
Explain line by line what is happening.

<details>
<summary>Answer</summary>
</br>

On `line 1` we have a call method `#map` on a nested array with  2 subarrays
then we start a block execution `line 1 to 9`with `arr` as block parameter.
`#map` will return a new array `[[27],[apple]]`.
</br>

On `line 2` there is a call method `#select` on `arr` who is refering to each
sub-array objects. On the same line we start the block execution with a block
parameter `item` passing each element of each sub-array (integer collection and string collection).
`#select` will return a new array based on the truthiness of the last line/s of a block(in this case `line 4 and 5`), on the example are only two items that verify the conditions. `'apple'` and `27`. It will return `[[27], ['apple']]`
</br>

On `line 3` we have a comparison, each item of the subarrays is converted first to string, then to integer and we compare with the same integer.
Using the conditional operator `if` we return a boolean, when is `true` it means that the element it is an integer.
</br>

On `line 4` we have `>` condition and we will only select each element as integer greater than 13.
</br>

On `line 5` we use `else` pass each of the non integer elements.
</br>

On `line 6` there is a method call `#size` to return the size of the string as an integer and with this integer we use `<` condition to only select each element which string size is smaller than 6.
</br>

In conclusion, in a nested array we need to iterate twice to reach each of the elements inside each array of the collection. Seem obvious but it is imporant to understand it. Also we use `#map` to returna new modified array.
with each we will have the original array. Then we use `#select` to filter specific items inside each sub-array.
Remember `#map` will always return the same size of array as a new one.
`#select` can return a difference size of the array as it is filtering.

</br>

***Original coment about the problem***

*At first you might think to reach for the select method to perform selection, but since we're working with a nested array, that won't work. We first need to access the nested arrays before we can select the value we want. In order to select the specified values in the requirement, we need to first determine if an element is an integer; there are lots of ways to do this, we just went with the imperfect item.to_s.to_i == item test.*

</br>

*One of the main reasons map is used in this example is not only to iterate over the array and access the nested arrays, but to return a new array containing the selected values. If we used each instead we wouldn't have the desired return value, and would need an extra variable to collect the desired results.*

</details>


</br>

#### Example 9
```ruby .numberLines
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
```
Try to break down each component:


<details>
<summary>Answer</summary>

**Approach**
1. Do we understand and know all methods on that code example?
Yes except `#partition` by definition:

*`#partition`: Returns two arrays, the first containing the elements of enum for
which the block evaluates to true, the second containing the rest*

2. Let's do a fast deconstrution. In case we can understand or solve the problem as we expected then let's do a more deep and line by line solution.

The inital object contains a triple-level nested array.
We are iterating 3 times in 3 different levels.

1st iteration: each sub-array with `#map` creating and returning a new array:
return: `[[1], [2], [3], [4]], [['a'], ['b'], ['c']]`

2nd iteration: each sub-sub-array with `each` returning the same array and just iterating.
return: `[[1], [2], [3], [4]], [['a'], ['b'], ['c']]`

3rd iteration: Each element from each sub-sub-array creating 2 new sub-arrays, one with the verified `true` result  and another with the rest.

* Condition of each elements, element.size greater than 0.
in case of the strigns all are `true` and in case of integers it is also true for all. Why? This is more tricky as `1.size # => 8` as the rest. This is the bites size of the integer
We can take a look on `Integer#size` documentation.

*`Ineger#size` Returns the number of bytes in the machine representation of int*

It is good to know... so we will have `[[1, 2, 3, 4, 'a', 'b', 'c'], []]` but this will not be shown...
But wait...What? Heeh? Why?
Because:
We have `#each` and then it ignores the retrun value even if it's happening... Then... The result will be same initial array/arrays. In this case  `[[1], [2], [3], [4]], [['a'], ['b'], ['c']]`.
In case we will at least print line 4. We can see is still happening. But nothing will be shown a the return is ignored.

What we can learn about it.

* Focus in the method we use for the callers to iterate. In `#each` case, we don't need to see the block to know the return value because is ignored.
BOf course we can store the result in an outer array or print it.

* Even if we ignore the return value it is still happening. It is just not shown.

***Original Solution***
*The key things to focus on with this example is understanding how each method works and the return value of the block. There are a total of 6 places where a return occurs: 3 methods (map, each, and partition) and 3 blocks (one for each method). By looking at the example, you should notice the first method call within map is each. If we understand each, we know that it doesn't care about the block's return value and it always returns the calling object. Therefore, just by looking at line 2, we can already say that the return value of map will be a new array that matches the value of the calling object. In this example, that's really all the interesting behavior there is as there are no side effects deeper in the code.*

</details>

</br>

#### Example 10
```ruby .numberLines
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```
break it down this problem.
What is the return value?


<details>
<summary>Answer</summary>

Obervations:

* It is 2-levels nested array.
* Is used `#map` for the iteration, so then we have new arrays
* there is a conditional operator in case is an integer.
* When the re is not an integer there is a second iteration (first array with an extra nested level).


The result will be.

On lines `1-11` is the first `#map` on `[[1, 2], [3, 4]]` and  `[5, 6]`

On lines `2-10` is the second `#map` on `[1, 2]` , `[3, 4]` and `5`, `6`

On lines `3-4` there is an `if` condition when we convert `to_s` and the `#size` is equal `1`(in this example only happens whenis an integer) is `true` then we add + 1 to the element.

On `line 4` the return value will be `6`, `7`

On `line 5` we have an else condition for the non integers (the rest are arrays)

On `line 6` we have the iteration of the last nested array with `n` as block parameter. we will pass each `1`, `2` and `3`, `4` integer nested inside the 3 level nested array.

On `line 7` will add `+1` to each of the passed items.
The final result will be

```ruby
=> [[[2,3],[4,5]], [6,7]]
```


***Original solution***

*The tricky part about this example is that the original array has uneven nested levels. If we want to add 1 to each value we first need to find a way to access those values, regardless of how many arrays they're nested in. To do this, we determine if the current element is an array or an integer and then execute the appropriate code.*

*map is a good choice for this task because it returns a new array containing transformed values. This way we can ultimately return a new array with the same nested levels as the original.*

*In practice, this type of nested data processing is typically a sign of bad design. But if you ever find yourself in that situation, you should be confident in your ability to work through it.*

</details>
</br>
</br>

____
*letter style meaning on tables:*

***Imporant and extra review***
**To review**
normal
*notes*