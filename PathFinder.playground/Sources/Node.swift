public class Node : CustomStringConvertible, Equatable {
    
    public var neighbours: [Edge]
    
    public private(set) var name: String
    public var distance: Int?
    public var visited: Bool
    
    public init(_ name: String) {
        self.name = name
        self.neighbours = []
        self.visited = false
    }
    
    public var description: String {
        if let distance = distance {
            return "Node(name: \(name), distance: \(distance))"
        }
        return "Node(name: \(name), distance: infinity)"
    }
    
    public var hasDistance: Bool {
        return distance != nil
    }
    
    public func remove(_ edge: Node) {
        neighbours.remove(at: neighbours.index { $0 === edge }!)
    }
}

public func == (_ lhs: Node, rhs: Node) -> Bool {
    return lhs.name == rhs.name && lhs.neighbours == rhs.neighbours
}
