require_relative 'node'
require 'benchmark'

class Heap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    placed = nil
    if root == @root
      children = [root]
    else
      children = root
    end
    nextRow = []
    children.each do |child|
      # if not empty, add left child to the queue
      if child.left == nil
          child.left = node
          node.parent = child
          placed = node
      # if not emptry, add right child to the queue
      elsif child.right == nil
          child.right = node
          node.parent = child
          placed = node
      else
          nextRow.push(child.left)
          nextRow.push(child.right)
      end
      if placed
        break
      end
    end

    if placed != nil
      order(placed)
    else
      insert(nextRow, node)
    end
  end

  def order(node)
    if node != @root && node != nil
      if node.rating < node.parent.rating
        grandparent = node.parent.parent if node.parent.parent != nil
        parent = node.parent
        left = node.left
        right = node.right

        # temporary var temp if the node's parent has another child
        if parent.left == node
          temp = node.parent.right
        else
          temp = node.parent.left
        end
        if temp != nil
          if parent.left == node
            node.right = temp
          else
            node.left = temp
          end
          temp.parent = node
        end
        if parent.left == node
          node.left = parent
        else
          node.right = parent
        end
        parent.parent = node
        left.parent = parent if left != nil
        right.parent = parent if right != nil
        parent.left = left
        parent.right = right
        if grandparent != nil && grandparent.left == parent
          grandparent.left = node
        end
        if grandparent != nil && grandparent.right == parent
          grandparent.right = node
        end

        if grandparent == nil
          @root = node 
        end
        
        node.parent = grandparent
        order(node)
      end
    end
  end

  def find(node, value)
    if node == nil
      return nil
    elsif node.title == value
      return node
    else
      a = find(node.right, value)
      b = find(node.left, value)
      if a != nil
        return a
      elsif b != nil
        return b
      else
        return nil
      end
    end
  end

  def delete(root, data)
    found = find(root, data)
    return nil if found == nil
    replacement = grab_last()
    if replacement != found
      if replacement.parent.right == replacement
         replacement.parent.right = nil
      end
      if replacement.parent.left == replacement
         replacement.parent.left = nil
      end
      if found.parent != nil
         replacement.parent = found.parent
        if found.parent.left == found
           found.parent.left = replacement
        else
           found.parent.right = replacement
        end
      else
         replacement.parent = nil
         @root = replacement
      end
      replacement.left = found.left
      replacement.right = found.right
      found.left.parent = replacement if !found.left.nil?
      found.right.parent = replacement if !found.right.nil?
      order(replacement)
      if (!replacement.left.nil? && replacement.rating > replacement.left.rating) || (!replacement.right.nil? && replacement.rating > replacement.right.rating)
        lower(replacement)
      end
    else
      if found.parent.left == found
        found.parent.left = nil
      else
        found.parent.right = nil
      end
      found = nil
    end
  end

  def lower(node)
    unless node.left.nil?
      if node.right.nil? || node.left.rating < node.right.rating
        swap = node.left
        swap.left.parent = node if !swap.left.nil?
        node.left = swap.left
        swap.left = node

        swap.right.parent = node if !swap.right.nil?
        temp = node.right
        node.right = swap.right
        swap.right = temp
        temp.parent = swap
      else
        swap = node.right
        temp = node.left

        swap.left.parent = node
        swap.right.parent = node

        node.right = swap.right
        node.left.parent = swap
        node.left = swap.left

        swap.left = temp
        swap.right = node
      end

      unless node.parent.nil?
        if node.parent.left == node
          node.parent.left = swap
        else
          node.parent.right = swap
        end
      else
        @root = swap
      end
      swap.parent = node.parent
      node.parent = swap

      if (!node.left.nil? && node.rating > node.left.rating) || (!node.right.nil? && node.rating > node.right.rating)
        lower(node)
      end
    end
  end


  def grab_last(children=nil)
    if children == nil
      children = [@root]
    end
    nextRow = []
    children.each do |child|
      nextRow.push(child.left) if child.left != nil
      nextRow.push(child.right) if child.right != nil
    end
    if nextRow.size == 0
      return children[-1]
    else
      grab_last(nextRow)
    end
  end

  def printf(children=nil)
    if children == nil
      if @root
        children = [@root]
      else
        return nil
      end
    end
    nextRow = []
    children.each do |child|
      puts "#{child.title}: #{child.rating}"
      nextRow.push(child.left) if child.left != nil
      nextRow.push(child.right) if child.right != nil
    end
    if nextRow.size == 0
      return nil
    else
      printf(nextRow)
    end
  end
end
