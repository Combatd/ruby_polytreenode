class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    # get parent instance variable
    def parent
        @parent
    end

    # get children instance variable
    def children
        @children
    end

    # get value stored at node
    def value
        @value
    end

    def parent=(node)
        if @parent
            old_parent = @parent
            old_parent.children.delete(self)
        end
        @parent = node
        if !node
            return
        else
            node.children << self
        end
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        raise 'Bad parent=!' if self.children.none?(child_node)
        child_node.parent=(nil)
    end

    # depth-first-search (stack)
    def dfs(target_value)
        return self if self.value === target_value
        self.children.each do  |child| 
            next_search = child.dfs(target_value)
            # only return if it actually returns correct value
            return next_search if next_search != nil
        end
        nil
    end

    # breadth-first-search (queue)
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

end