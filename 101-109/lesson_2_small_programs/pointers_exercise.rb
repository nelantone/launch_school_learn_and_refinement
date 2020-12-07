name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

#
#>>'Alice'=>nil
#>>'Bob'  =>nil
# when we reassign a variable we point to another memory space and we have
# different object ids, this concept is expained as variables as  pointers.
#

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

#
>> BOB => nil
>> BOB => nil
#
# when we mutate the obect itslef with a destuctive method as #upcase! we will
# mutate the object and name, saved_name will still point to the same place in
# memory these variables will be linked until we reassign one of them.