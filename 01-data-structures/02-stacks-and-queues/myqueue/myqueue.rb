class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue.push(element)
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    item = @queue.delete_at(0)
    @head = @queue[0]
    @tail = @queue[-1]
    return item
  end

  def empty?
    if (@queue.length === 0)
      return true
    else
      return false
    end
  end
end