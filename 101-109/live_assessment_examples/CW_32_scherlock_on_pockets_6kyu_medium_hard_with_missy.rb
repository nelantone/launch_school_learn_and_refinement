=begin
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.
Allowed items are defined by array of numbers given as an argument. Pockets contents are defined by hash entries where key is a person and value is one or few things represented by an
array of numbers (can be nil or empty array if empty), example:
pockets = {
bob: [1],
tom: [2, 5],
jane: [7]
}
Write amethod which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the
method should return nil.

=end
=begin
* Problem understanding:
  - Mental model:
    - we want to find and return in an arrya of symboles the suspects that don't have the number/s in second argument(because they shouldn't have number-item/s)
  In the first argument are defined the pocket/items and specifc number with as key as a person/name

  * if you have any  but items you are in trouble

  - Input: hash

  - Output array

  - Rules:
    - Explicit:
      - the number shoudn't be present in the value of a person/name

    - Implicit:

  - Questions:

* Examples:
[] -> all supects
[all numbers] = no suspect

* Data Structure:
  -hash
* Algorithm:
  - Main Algorithm:
    - iterate thour all allowed items and from each element do the next:
    - we want to iterate from first arg (pockets) and reject the name/person when the value is present(not selecting) in the specific person.
      - an we only want to return the not rejected key-names(suspects)
      - if the item_poeck has allowed_item then is not in problems, then we reject it form the list.
  - Ideas:
    -use reject

  - Higher Level Algorithm(helper methods):

* Code:
=end
pockets = {
bob: [1],
tom: [2, 5],
jane: [7]
}

def find_suspects(name_items_pocket, allowed_items)

  result = name_items_pocket.reject { |name, item_pocket| item_pocket.all? { |good_item| allowed_items.include? (good_item) }}

  result.keys.empty? ? nil : result.keys
end


p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]

# Do again this example! (1st->(35'-40'))