public class Edge: Equatable {
    public var neighbour: Node
    
    public init(_ neighbour: Node) {
        self.neighbour = neighbour
    }
}

public func == (_ lhs: Edge, rhs: Edge) -> Bool {
    return lhs.neighbour == rhs.neighbour
}
