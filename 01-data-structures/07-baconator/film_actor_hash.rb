require_relative 'node'
require 'pry'

class Bacon

    attr_accessor :actors
    attr_accessor :movies

    def initialize
        @movies = Hash.new
        @movies["Footloose"] = ["Kevin Bacon", "Lori Singer", "John Lithgow", "Chris Penn"]
        @movies["JFK"] = ["Kevin Bacon", "Jim Garrison", "Kevin Costner", "Gary Oldman", "Donald Sutherland", "Tommy Lee Jones"]
        @movies["My Dog Skip"] = ["Kevin Bacon", "Frankie Muniz", "Diane Lane", "Luke Wilson", "Caitlin Wachs", "Carrie Fisher"]
        @movies["The Man with One Red Shoe"] = ["Lori Singer", "Tom Hanks", "Carrie Fisher", "Dabney Coleman", "Jim Belushi"]
        @movies["Short Cuts"] = ["Julianne Moore", "Tim Robbins", "Jennifer Jason Leigh", "Jack Lemmon", "Andie MacDowell", "Lori Singer"]
        @movies["Warlock"] = ["Julian Sands", "Lori Singer", "Richard E. Grant", "Mary Woronov", "Richard Kuss"]
        @movies["Shrek"] = ["Mike Myers", "Eddie Murphy", "Cameron Diaz", "Cody Cameron", "Conrad Vernon", "John Lithgow"]
        @movies["Daddy's Home 2"] = ["Will Ferrell", "Alessandra Ambrosio", "Linda Cardellini", "Mel Gibson", "Didi Costine", "John Lithgow"]
        @movies["Harry and the Hendersons"] = ["William Dear", "Kevin Peter Hall", "John Lithgow", "Melinda Dillon", "Margaret Langrick"]
        @movies["Reservoir Dogs"] = ["Quentin Tarantino", "Micheal Madsen", "Tim Roth", "Steve Buscemi", "Harvey Keitel", "Chris Penn"]
        @movies["Rush Hour"] = ["Jackie Chan", "Chris Tucker", "Julia Hsu", "Elizabeth Pena", "Tzi Ma", "Chris Penn"]
        @movies["Pale Rider"] = ["Clint Eastwood", "Sydney Penny", "Carrie Snodgress", "Micheal Moriarty", "Chris Penn"]
        @movies["The Hunger Games"] = ["Donald Sutherland"]
        @movies["The Leisure Seeker"] = ["Donald Sutherland"]
        @movies["Animal House"] = ["Donald Sutherland", "Kevin Bacon"]
        @movies["Toy Story"] = ["Tom Hanks"]
        @movies["Saving Private Ryan" ] = ["Tom Hanks"]
        @movies["Forrest Gump"] = ["Tom Hanks"]
        @movies["Sully"] = ["Tom Hanks"]
        @movies["The Green Mile"] = ["Tom Hanks"]
        @movies["The Polar Express"] = ["Tom Hanks"]
        @movies["Apollo 13"] = ["Tom Hanks", "Kevin Bacon"]
        @movies["The Karate Kid"] = ["Jackie Chan"]
        @movies["Dragon Blade"] = ["Jackie Chan"]
        @movies["Who Am I?"] = ["Jackie Chan"]
        @movies["The Foreigner"] = ["Jackie Chan"]
        @movies["The Fifth Element"] = ["Gary Oldman"]
        @movies["The Dark Knight"] = ["Gary Oldman"]
        @movies["The Dark Knight Rises"] = ["Gary Oldman"]
        @movies["The Book of Eli"] = ["Gary Oldman"]
        @movies["Air Force One"] = ["Gary Oldman"]
        @movies["Kung Fu Panda 2"] = ["Gary Oldman"]
        @movies["Kelly's Heroes"] = ["Donald Sutherland"]
        @movies["The Big Easy"] = ["Jim Garrison"]
        @movies["The Bodyguard"] = ["Kevin Costner"]
        @movies["No Way Out"] = ["Kevin Costner"]
        @movies["Dances with Wolves"] = ["Kevin Costner"]
        @movies["Waterworld"] = ["Kevin Costner"]

            
        @actors = Hash.new
        @actors["Kevin Bacon"] = ["Footloose", "JFK", "Animal House", "Apollo 13", "My Dog Skip"]
        @actors["Lori Singer"] = ["Footloose", "The Man with One Red Shoe", "Short Cuts", "Warlock"]
        @actors["John Lithgow"] = ["Footloose", "Shrek", "Daddy's Home 2", "Harry and the Hendersons"]
        @actors["Chris Penn"] = ["Rush Hour", "Reservoir Dogs", "Footloose", "Pale Rider"]
        @actors["Jim Garrison"] = ["JFK", "The Big Easy"]
        @actors["Kevin Costner"] = ["The Bodyguard", "JFK", "No Way Out", "Dances with Wolves", "Waterworld"]
        @actors["Gary Oldman"] = ["The Fifth Element", "The Dark Knight", "The Dark Knight Rises", "The Book of Eli", "Air Force One", "Kung Fu Panda 2", "JFK"]
        @actors["Tommy Lee Jones"] = ["JFK"]
        @actors["Frankie Muniz"] = ["My Dog Skip"]
        @actors["Carrie Fisher"] = ["My Dog Skip", "The Man with One Red Shoe"]
        @actors["Dabney Coleman"] = ["The Man with One Red Shoe"]
        @actors["Jim Belushi"] = ["The Man with One Red Shoe"]
        @actors["Julianne Moore"] = ["Short Cuts"]
        @actors["Tim Robbins"] = ["Short Cuts"]
        @actors["Jennifer Jason Leigh"] = ["Short Cuts"]
        @actors["Jack Lemmon"] = ["Short Cuts"]
        @actors["Andie MacDowell"] = ["Short Cuts"]
        @actors["Julian Sands"] = ["Warlock"]
        @actors["Richard E. Grant"] = ["Warlock"]
        @actors["Mary Woronov"] = ["Warlock"]
        @actors["Richard Kuss"] = ["Warlock"]
        @actors["Mike Myers"] = ["Shrek"]
        @actors["Eddie Murphy"] = ["Shrek"]
        @actors["Cameron Diaz"] = ["Shrek"]
        @actors["Cody Cameron"] = ["Shrek"]
        @actors["Conrad Vernon"] = ["Shrek"]
        @actors["Alessandra Ambrosio"] = ["Daddy's Home 2"]
        @actors["Linda Cardellini"] = ["Daddy's Home 2"]
        @actors["Melinda Dillon"] = ["Harry and the Hendersons"]
        @actors["Didi Costine"] = ["Daddy's Home 2"]
        @actors["Will Ferrell"] = ["Daddy's Home 2"]
        @actors["William Dear"] = ["Harry and the Hendersons"]
        @actors["Kevin Peter Hall" ] = ["Harry and the Hendersons"]
        @actors["Margaret Langrick"] = ["Harry and the Hendersons"]
        @actors["Quentin Tarantino"] = ["Reservoir Dogs"]
        @actors["Micheal Madsen"] = ["Reservoir Dogs"]
        @actors["Tim Roth"] = ["Reservoir Dogs"]
        @actors["Steve Buscemi"] = ["Reservoir Dogs"]
        @actors["Harvey Keitel"] = ["Reservoir Dogs"]
        @actors["Chris Tucker"] = ["Rush Hour"]
        @actors["Julia Hsu"] = ["Rush Hour"]
        @actors["Elizabeth Pena"] = ["Rush Hour"]
        @actors["Tzi Ma"] = ["Rush Hour"]
        @actors["Sydney Penny"] = ["Pale Rider"]
        @actors["Carrie Snodgress"] = ["Pale Rider"]
        @actors["Micheal Moriarty"] = ["Pale Rider"]
        @actors["Donald Sutherland"] = ["The Hunger Games", "The Leisure Seeker", "Kelly's Heroes", "Animal House", "JFK"]
        @actors["Tom Hanks"] = ["Toy Story", "Saving Private Ryan", "Forrest Gump", "Sully", "The Green Mile", "The Polar Express", "Apollo 13", "The Man with One Red Shoe"]
        @actors["Jackie Chan"] = ["The Karate Kid", "Rush Hour", "Dragon Blade", "Who Am I?", "The Foreigner"]
        @actors["Clint Eastwood"] = ["Pale Rider"]
        @actors["Luke Wilson"] = ["My Dog Skip"]
        @actors["Diane Lane"] = ["My Dog Skip"]
        @actors["Caitlin Wachs"] = ["My Dog Skip"]
        @actors["Mel Gibson"] = ["Daddy's Home 2"]
    end

# Test entry Chris Penn
    def find_kevin_bacon(start, degrees = 1, checked_actors = [])
        # How many layers deep to find Kevin Bacon
        if start.name == "Kevin Bacon"
            puts "You can't use Kevin Bacon as your actor for this! Try a different actor."
            return
        end
        checked_actors.push(start.name)
        @actors[start.name].each do |x|
            @movies[x].each do |a|
                if a == "Kevin Bacon"
                    if (degrees >= 1)
                        puts "Found Kevin Bacon! He was #{degrees} degrees away!"
                        return 
                    else 
                        puts "Found Kevin Bacon! He was #{degrees} degree away!"
                        return
                    end
                end
            end
        end
        @actors[start.name].each do |x|
            list = @movies[x].sort {|a,b| a.length <=> b.length}
            checked_actors.each do |name|
                for x in(0..list.length - 1) do
                    if !checked_actors.include?(list[x])
                        new_node = Node.new(list[x], @actors[list[x]])
                        find_kevin_bacon(new_node, degrees + 1, checked_actors)
                    end
                end
            end
        end
    end
    # Smaller version of test case, tests to see if 
    def test
        #  single = Node.new("Mike Myers", @actors["Mike Myers"])
        #  self.find_kevin_bacon(single)
        list = @actors.keys
        list.each do |name|
                start = Node.new(name, @actors[name])
                self.find_kevin_bacon(start)
        end
    end
end
bacon = Bacon.new
bacon.test





