```ruby
 array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
 array2 = []
 array1.each { |value| array2 << value }
 array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
 puts array2
```
#### What do the following code blocks return? `=>`
#### What does it output? `>>`
`1: >> => ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Zeppo']`
initialize variable array1 pointing to collection of array stings/object
`2: >> => []`
initialize variable array2 pointing to an empty object collection
`3: >> => ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Zeppo']`
use method #each iteration over the object array concatenating each value into array2.
`4: >> => ['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Zeppo']`
 use method #each iteration over the object array using destructive method with a condicional operator when value start "S" or "C" on the same array `array1` mutating the object/s and pointing to the same object_id.
`5: >> 'Moe' \n 'Larry' \n 'CURLY' \n 'SHEMP' \n 'Harpo' \n 'CHICO' \n 'Zeppo' => nil`
array2 objects are pointing to the same objects as array1 this is why we have the same mutations and the destructive method will mutate objects inside the colection and will point to the same place in memory.
#### Why?
The reason of this is explained below.
#### What concept does it demonstrate?
The concepts we demonstrate are.
1. variables as pointers: the initialized arrays have different collection strings pointing to a specific space in memory. one we pass these variables using #<< concatenation we are using a destructive method that mutates the array but not the string objects in the collection. on line 3 we mutate specific string objects. As #upcase! is a destructive method and this specific objects are pointing on the same memory space on both arrays will be mutating simultaneously.
2. pass by reference: In ruby when we mutate the result of a method we say that we passed an intialized variable in the outer sope as arguments in the inner scope of a method changing the original value but the object still pointing to the same space in memory.