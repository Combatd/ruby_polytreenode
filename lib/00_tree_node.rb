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
            if child.value === target_value 
                return child
            end
            if child.children
                child.children.each { |child_node| return child_node if child_node.value === target_value }
            end
        end
        return nil
        stack
    end

end