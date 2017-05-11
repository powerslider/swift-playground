public class Node : CustomStringConvertible, Equatable {
    
    public var neighbours: [Edge]
    
    public private(set) var name: String
    public var distance: Int?
    public var visited: Bool
    public var x: Int
    public var y: Int
    public var parent: Node?
    
    public convenience init(_ name: String, x: Int, y: Int, parent: Node?) {
        self.init(name, x: x, y: y)
        self.parent = parent
    }
    
    public init(_ name: String, x: Int, y: Int) {
        self.name = name
        self.x = x
        self.y = y
        self.neighbours = []
        self.visited = false
        self.parent = nil
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
    return lhs.x == rhs.x && lhs.y == rhs.y
}
