# Ruby PolyTree Nodes Project

[Deployed Repl.it Project]
Type "rspec" in the console to see if it passes the tests!

## Learning Goals
* Know how to implement a polytree using polytree nodes
* Know how to implement BFS and DFS for your polytree* 
* Be able to explain the differences between BFS and DFS and when one might be preferred

## Class PolyTreeNode
* An #initialize(value) method that sets the value, and starts parent as nil, and children to an empty array.
* A #parent method that returns the node's parent.
* A #children method that returns an array of children of a node.
* A #value method that returns the value stored at the node.
* #dfs(target_value) method which takes a value to search for and performs the search. 
```
 def dfs(target_value)
        return self if self.value === target_value
        self.children.each do  |child| 
            next_search = child.dfs(target_value)
            # only return if it actually returns correct value
            return next_search if next_search != nil
        end
    nil
end
```

```
          1
         / \
        2   5
       /   / \
      3   6   9
     /   / \
    4   7   8
```


* #bfs(target_value) method to implement breadth first search.
```
def bfs(target_value)
        queue = []
        visited = []
        result = nil
        queue << self
        return self if self.value === target_value
        visited << queue.shift
        queue = self.children
        while !(queue.empty?)
            return result = queue.first if queue.first.value === target_value
            queue.first.children.each {|child| queue << child }
            visited << queue.shift
        end
        result
end
```

```
          1
         / \
        2   3
       /   / \
      4   5   6
     /   / \
    7   8   9
```
