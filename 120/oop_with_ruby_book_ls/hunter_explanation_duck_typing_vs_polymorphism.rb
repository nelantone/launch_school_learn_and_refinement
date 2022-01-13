# differnet classes, same methodn inovcation
# prupose: different datatypes to respond

p a= "tonio".reverse #      String#reverse

p b = ["hunter", "tonio"].reverse #      Array#reverse

module Animals
  class Bear
  end

  class Dog
  end
end

######
class Chicken
  # def say_hi
  #   puts "cluck"
  # end
  def eat
  end
end


class Human
  # def say_hi
  #   puts  "Qué tal?!"
  # end
  def eat
  end
end



# differnet classes, same methodn inovcation
# prupose: group them informally (group them together to make method call easier)
prison = [] << Chicken.new << Human.new

prison.each(&:say_hi)

### ?

[a, b].map(&:reverse)




###############

"hunter" + "tonio"

1 + 2