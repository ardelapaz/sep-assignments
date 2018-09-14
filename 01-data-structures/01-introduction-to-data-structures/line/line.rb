# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    return self.members = []
  end

  def join(person)
    return self.members.push(person)
  end

  def leave(person)
    self.members.each_with_index do |member, index|
      if (member == person) 
        self.members.delete_at(index)
      end
    end
  end

  def front
    return self.members[0]
  end

  def middle
    middle = (self.members.length / 2)
    return self.members[middle]
  end

  def back
    last = (self.members.length - 1)
    return self.members[last]
  end

  def search(person)
    self.members.each do |member|
      if (member == person) 
        return member 
      end
    end
    return nil
  end

  private

  def index(person)
    self.members.each do |member|
      if (member == person) 
        return member 
      end
    end
    return nil
  end

end