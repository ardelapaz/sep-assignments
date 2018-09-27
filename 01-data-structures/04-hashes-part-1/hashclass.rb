class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    # Hash the key, find true index, assign value to true index

    # 
    i = index(key, size())

    # If items is null at index, hash value
    if @items[i] == nil
      @items[i] = HashItem.new(key, value)

      # If items's key is the same as in the hash, and the value is the same, item is a duplicate
    elsif @items[i].key == key && @items[i].value == value
      return

      # If item is not a duplicate, and isn't a new entry, hash must be full. Resize and readd
    else
      loop do
        resize()
        j = index(key,size())
        break if @items[j] == nil || @items[j].key == key 
        end
        j = index(key, size())
        if @items[j] == nil
          @items[j] = HashItem.new(key, value)
        else 
          @items[j].value = value
        end
      end
  end


  def [](key)
    # hash the key, find the true index, return value
    i = index(key, size())

    if @items[i]
      return @items[i].value
    end
  end

  def resize
    # Call original function after doubling

    # Double the size of the array
    newArray = Array.new(size() * 2)

    # From 0 to the final index in @items, take that index and if it exists push it to the new array with the new index. (Transfer old array into new bigger array)
    (0...@items.length).each do |index|
      if @items[index]
        newIndex = @items[index].key.sum % newArray.length
        newArray[newIndex] = @items[index]
        @items[index] = nil
      end
    end

    # Return resized hash
    @items = newArray
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |n|
      sum += n
    end

    sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end
