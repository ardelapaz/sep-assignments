class Node
    attr_accessor :name
    attr_accessor :film_actor_hash
  
    def initialize(name, hash)
        @name = name #name of actor
        @flim_actor_hash = hash #movie hash of actor
    end
  end