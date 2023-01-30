class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    def add(neighbor_val)
        @neighbors << neighbor_val
    end

    def bfs(starting_node, target_node)
        nodes = [starting_node]
        while !nodes.empty?
            node = nodes.shift
            return node if starting_node.value == target.value
            nodes += (node.neighbors)
        end
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]