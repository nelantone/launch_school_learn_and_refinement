arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
 n + 1
 end

p new_array

=begin
lin6: will output an array [1..10] and return an array [1..10] 
line1: we initialize the local variable arr and assign to it an Array object with integers 1 through 10 as elements.
line3: we initialize the local variable new_array and assign it to the return value of:
line 3-5: we invoke the #select method on the local variable arr and pass the do..end block as an argument.
As the select method iterates over each element in the array, it passes it to the block parameter n. The code on lin 4 adds 1 to , but nothing is done with this.

This problem demostrates the concept of truthiness. The select method returns a new array based on the return value of the  block. If the return value evaluates to true, then the element is elected.  Since everything in Ruby is truthy other than false or nil, the code on line 4 evaluates to true.

##
iwe set an array 'arr' with 1..10 numbers/items
we set 'new_array' passing each n-item using the select method
select method it evaluates the with an 'if statement' the truthiness of the condition inside the block and push the true values to a new array.
in this case n+1, as 1+1 etc... are all 'true'. The 'if' condition "if 1+1" is true as in ruby
everything evaluated has truetiness except false and nil.
5: otuput will be the same value of  arr itself as new_array (select method returns the intial array)
=end


