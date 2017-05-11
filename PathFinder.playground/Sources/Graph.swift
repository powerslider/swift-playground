public class Graph : CustomStringConvertible, Equatable {
    
    public private(set) var nodes: [Node]
    
    public init() {
        self.nodes = []
    }
    
    public func addNode(_ name: String, x: Int, y: Int) -> Node {
        let node = Node(name, x: x, y: y)
        nodes.append(node)
        return node
    }
    
    public func addEdge(_ source: Node, neighbour: Node) {
        let edge = Edge(to: neighbour)
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
    
    public func findNodeWithName(_ name: String) -> Node {
        return nodes.filter { $0.name == name }.first!
    }
    
}

public func == (_ lhs: Graph, rhs: Graph) -> Bool {
    return lhs.nodes == rhs.nodes
}
