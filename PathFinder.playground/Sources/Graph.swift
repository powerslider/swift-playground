public class Graph : CustomStringConvertible, Equatable {
    
    public private(set) var nodes: [Node]
    
    public init() {
        self.nodes = []
    }
    
    public func addNode(_ name: String) -> Node {
        let node = Node(name)
        nodes.append(node)
        return node
    }
    
    public func addEdge(_ source: Node, neighbour: Node) {
        let edge = Edge(neighbour)
        source.neighbours.append(edge)
    }
    
    public var description: String {
        var description = ""
        
        for node in nodes {
            if !node.neighbours.isEmpty {
                description += "[\(node.name) -> \(node.neighbours.map { $0.neighbour.name})]"
            }
        }
        return description
    }
    
    public func findNodeWithname(_ name: String) -> Node {
        return nodes.filter { $0.name == name }.first!
    }
    
}

public func == (_ lhs: Graph, rhs: Graph) -> Bool {
    return lhs.nodes == rhs.nodes
}
