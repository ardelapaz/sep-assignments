require_relative 'node'

class OpenAddressing

    def initialize(size)
      @hash = Array.new(size)
      @entries = 0
    end
  
    def []=(key, value)
      # Hash the key, find true index, assign value to true index

      i = index(key, size())
  
      # If hash is null at index, hash value
      if @hash[i] == nil
        @hash[i] = Node.new(key, value)
        @entries += 1
  
        # If hash's key is the same as in the hash, and the value is the same, item is a duplicate
      elsif @hash[i].key == key && @hash[i].value == value
        return "duplicate entry"

        # If hash key is the same but value is out of date update the value

      elsif @hash[i].key == key && @hash[i].value != value
        @hash[i].value = value
  
        # If item is not a duplicate, and isn't a new entry, hash must be full. Resize and readd
      else
        j = next_open_index(i)
        if j == -1
          resize()
          self[key] = value
        else
          @hash[j] = Node.new(key, value)
          @entries += 1
          end
        end
    end
  
  
    def [](key)
      # hash the key, find the true index, return value
      (0..size()).each do |index|
        if @hash[index] != nil
          if @hash[index].key == key 
            return @hash[index].value
          end
        end
      end
      return "Pair was not found"
    end

    def print_hash
      (0..size()).each do |index|
        if @hash[index] != nil
          puts "index: #{i},  key: #{@hash[index].key}, value: #{@hash[index].value}"
        end
      end
    end
  

    def next_open_index(index)
      (index...size()).each do |index|
        if @hash[index] == nil
          return index
        end
      end
      return -1
    end
  
    def resize
      # Call original function after doubling
  
      # Double the size of the array
      newArray = Array.new(@hash.length * 2)
  
      # From 0 to the final index in @hash, take that index and i f it exists push it to the new array with the new index. (Transfer old array into new bigger array)
      (0...@hash.length).each do |index|
        if @hash[index]
          newIndex = @hash[index].key.sum % newArray.length
          newArray[newIndex] = @hash[index]
          @hash[index] = nil
        end
      end
  
      # Return resized hash
      @hash = newArray
    end
  
    # Returns a unique, deterministically reproducible index into an array
    # We are hashing based on strings, let's use the ascii value of each string as
    # a starting point.
    def index(key, size)  
      key.sum % size
    end
  
    # Simple method to return the number of hash in the hash
    def size
      return @hash.length
    end
  
end
