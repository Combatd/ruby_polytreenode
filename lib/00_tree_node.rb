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
end