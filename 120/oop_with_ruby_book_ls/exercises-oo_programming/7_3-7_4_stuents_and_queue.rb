# 7.3 Students
# Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation details for the
# initialize methods in Graduate and Undergraduate are missing. Fill in those missing details so that the following requirements are fulfilled:
# -  Graduate students have the option to use on-campus parking, while Undergraduate students do not.
# - Graduate and Undergraduate students both have a name and year associated with them.
# Note, you can do this by adding or altering no more than 5 lines of code.

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super(name, year)
  end
end

# Circular Queue
# A circular queue is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular queue, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the queue the longest.
#
#   This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the queue requires getting rid of an existing object; with a circular queue, the object that has been in the queue the longest is discarded and replaced by the new object.
#
#   Assuming we have a circular queue with room for 3 objects, the circular queue looks and acts like this:
#
#                                                                                                       P1	P2	P3	Comments
#   All positions are initially empty
#   1			Add 1 to the queue
#   1	2		Add 2 to the queue
#   2		Remove oldest item from the queue (1)
#   2	3	Add 3 to the queue
#   4	2	3	Add 4 to the queue, queue is now full
#   4		3	Remove oldest item from the queue (2)
#   4	5	3	Add 5 to the queue, queue is full again
#   4	5	6	Add 6 to the queue, replaces oldest element (3)
#   7	5	6	Add 7 to the queue, replaces oldest element (4)
#   7		6	Remove oldest item from the queue (5)
#   7			Remove oldest item from the queue (6)
#   Remove oldest item from the queue (7)
#   Remove non-existent item from the queue (nil)

# Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

                                                                                                                                                                                                                                  enqueue to add an object to the queue
  # dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.
  #   You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).
  #
  #   Examples:
  queue = CircularQueue.new(3)
  puts queue.dequeue == nil

  queue.enqueue(1)
  queue.enqueue(2)
  puts queue.dequeue == 1

  queue.enqueue(3)
  queue.enqueue(4)
  puts queue.dequeue == 2

  queue.enqueue(5)
  queue.enqueue(6)
  queue.enqueue(7)
  puts queue.dequeue == 5
  puts queue.dequeue == 6
  puts queue.dequeue == 7
  puts queue.dequeue == nil

  queue = CircularQueue.new(4)
  puts queue.dequeue == nil

  queue.enqueue(1)
  queue.enqueue(2)
  puts queue.dequeue == 1

  queue.enqueue(3)
  queue.enqueue(4)
  puts queue.dequeue == 2

  queue.enqueue(5)
  queue.enqueue(6)
  queue.enqueue(7)
  puts queue.dequeue == 4
  puts queue.dequeue == 5
  puts queue.dequeue == 6
  puts queue.dequeue == 7
  puts queue.dequeue == nil
  # The above code should display true 15 times.

class CircularQueue
  attr_accessor :ary

  def initialize(size)
    @ary = [nil] * size
  end

  def dequeue
    if @ary.all?(nil)
      nil
    else
      minim_num = @ary.compact.min
      idx       = @ary.index(minim_num)
      @ary[idx] = nil
      minim_num
    end
  end

  def enqueue(num)
    return @ary[0] = num if @ary.all?(nil)

    @ary.each_with_index do |item, idx|
      if @ary.any?(nil)
        return @ary[idx] = num if item.nil?
      else
        minim_num = @ary.compact.min
        idx       = @ary.index(minim_num)
        return @ary[idx] = num
      end
    end
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil