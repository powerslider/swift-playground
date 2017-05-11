//: Playground - noun: a place where people can play

var maze: [[String]] = [["^", "0", "0", "0", "0", "0", "0", "1"],
            ["0", "1", "1", "1", "1", "1", "0", "0"],
            ["0", "0", "0", "0", "0", "1", "1", "1"],
            ["0", "1", "1", "1", "0", "1", "0", "0"],
            ["0", "1", "0", "1", "0", "0", "0", "1"],
            ["0", "0", "0", "1", "0", "1", "0", "*"]]

func maze2Graph(maze: [[String]]) -> Graph {
    let g = Graph()
    for row in 0..<maze.count {
        for col in 0..<maze[0].count {
            print("\(maze[row][col]), \(row), \(col)")
            g.addNode(maze[row][col], x: row, y: col)
        }
    }
    return g
}

func getNeighbours(current: Node, grid: [[String]]) -> [Edge] {
    var neighbours: [Edge] = []
    let OBSTACLE = "1"
    // west
    let westX = current.x;
    let westY = current.y - 1;
    if current.y > 0 &&  grid[westX][westY] != OBSTACLE {
        neighbours.append(Edge(Node(grid[westX][westY], x: westX, y: westY, parent: current)));
    }
    // south
    let southX = current.x + 1;
    let southY = current.y;
    if current.x < grid.count - 1 && grid[southX][southY] != OBSTACLE {
        neighbours.append(Edge(Node(grid[southX][southY], x: southX, y: southY, parent: current)));
    }
    // east
    let eastX = current.x;
    let eastY = current.y + 1;
    if current.y < grid[0].count - 1 && grid[eastX][eastY] != OBSTACLE {
        neighbours.append(Edge(Node(grid[eastX][eastY], x: eastX, y: eastY, parent: current)));
    }
    // north
    let northX = current.x - 1;
    let northY = current.y;
    if current.x > 0 && grid[northX][northY] != OBSTACLE {
        neighbours.append(Edge(Node(grid[northX][northY], x: northX, y: northY, parent: current)));
    }
    
    return neighbours;
}


func breadthFirstSearch(_ graph: Graph, source: Node, target: Node) -> [Node] {
    var distance = 1
    var queue = Queue<Node>()
    queue.enqueue(source)
    source.distance = distance
    
    var nodesExplored = [source]
    source.visited = true
    
    while let node = queue.dequeue() {
        for edge in getNeighbours(current: node, grid: maze) {
            let currentNode = edge.neighbour
            if !currentNode.visited {
                distance += 1
                currentNode.distance = distance
                print(currentNode)
                queue.enqueue(currentNode)
    
                currentNode.visited = true
                nodesExplored.append(currentNode)
                
                print("Current:\(currentNode) -> \(target)")
                if currentNode == target {
                    break
                }
            }
        }
    }
    
    return nodesExplored
}

let g = maze2Graph(maze: maze)
let source = Node("^", x: 0, y: 0)
let target = Node("*", x: maze.count - 1, y: maze[0].count - 1)
let nodesExplored = breadthFirstSearch(g, source: source, target: target)
//print(nodesExplored)
