require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if(node.rating > root.rating)
      if (root.right == nil) 
        root.right = node
      else
        insert(root.right, node)
      end
    elsif node.rating < root.rating
      if root.left == nil
        root.left = node 
      else
        insert(root.left, node)
      end
    else
      return "test"
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data == nil || root == nil
      return nil
  elsif root.title == data
      return root
  elsif root.left.nil?
    if root.right.title == data 
      return root.right 
    else
      find(root.right, data)
    end
  elsif root.right.nil? 
    if root.left.title == data 
      return root.left 
    else
      find(root.left, data)
    end
  end
  end

  def delete(root, data)
    desired_node = find(root, data)

    if desired_node.nil? 
      return nil 
    else
      desired_node.title = nil 
      desired_node.rating = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    new_children = []
    if children == nil 
      new_children = [@root.left, @root.right]
      puts "#{@root.title}: #{@root.rating}\n"
    else
      new_children = []
      children.each do |child|
        if child.nil?
          next 
        end
        puts "#{child.title}: #{child.rating}\n"
        new_children.push(child.left, child.right)
      end
    end
    if new_children.length > 0
      return printf(new_children) 
    end
  end
end
