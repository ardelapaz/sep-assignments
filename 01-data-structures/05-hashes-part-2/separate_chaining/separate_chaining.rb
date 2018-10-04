require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @hash = Array.new(size)
    @entries = 0
  end

  def []=(key, value)
    i = index(key, size())

    if @hash[i] == nil
      @hash[i] = LinkedList.new
      @hash[i].add_to_front(Node.new(key, value))
      @entries += 1

    else
      current = @hash[i].head

      until current == nil || current.key == key 
        current = current.next
      end

      if current == nil
        @hash[i].add_to_front(Node.new(key, value))
        @entries += 1
      elsif current.key == key && current.value != value
        current.value = value
      else
        return "duplicate entry"
      end
    end
    if load_factor() > @max_load_factor
      resize()
    end
  end

  def [](key)
    i = index(key, size())
    if @hash[i] != nil
      current = @hash[i].head
      until current == nil || current.key == key 
        current = current.next
      end

      if current == nil
        return "pair not found"
      else
        return current.value
      end
    else
      return "Nothing was found matching your infomation"
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end


  # Print out the hash along with the load factor
  def print_hash
    (0..size()).each do |index|
      if @hash[index] != nil
        puts "index: #{index}"
        @hash[index].print
      end
    end
    lf = load_factor
    puts "load factor: #{lf}"
  end

  # Calculate the current load factor
  def load_factor
    size = size() + 0.0
    return (@entries / size)
  end

  # Simple method to return the number of items in the hash
  def size
    return @hash.length
  end

  # Resize the hash
  def resize
    newArray = Array.new(@hash.length * 2)

    (0...@hash.length).each do |index|
      if @hash[index] != nil
        current = @hash[index].head
        until current == nil
          newIndex = current.key.sum % newArray.length
          newArray[newIndex] = LinkedList.new
          newArray[newIndex].add_to_front(current)
          current = current.next
        end
        @hash[index] = nil
      end
    end
    @hash = newArray
  end
end
