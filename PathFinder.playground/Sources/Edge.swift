public class Edge : Equatable, CustomStringConvertible {
    
    public var neighbour: Node
    public var direction: Direction
    
    public convenience init(to neighbour: Node, direction: Direction) {
        self.init(to: neighbour)
        self.direction = direction
    }
    
    public init(to neighbour: Node) {
        self.neighbour = neighbour
        self.direction = .NONE
    }
    
    public var description: String {
        return "Edge(to: \(neighbour), direction: \(direction))"
    }
}

public func == (_ lhs: Edge, rhs: Edge) -> Bool {
    return lhs.neighbour == rhs.neighbour
}
