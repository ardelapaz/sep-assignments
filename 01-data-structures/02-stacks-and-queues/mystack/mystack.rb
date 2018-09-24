class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    self.top = item 
    @stack << item
  end

  def pop
    length = @stack.length
    self.top = @stack[-2]
    return @stack.delete_at(length - 1)
  end

  def empty?
    if(self.top === nil) 
      return true
    end
    return false
  end
end