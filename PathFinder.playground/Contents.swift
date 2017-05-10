//: Playground - noun: a place where people can play

func breadthFirstSearch(_ graph: Graph, source: Node) -> [String] {
    var queue = Queue<Node>()
    queue.enqueue(source)
    
    var nodesExplored = [source.name]
    source.visited = true
    
    while let node = queue.dequeue() {
        for edge in node.neighbours {
            let currentNode = edge.neighbour
            if !currentNode.visited {
                queue.enqueue(currentNode)
                currentNode.visited = true
                nodesExplored.append(currentNode.name)
            }
        }
    }
    
    return nodesExplored
}



let graph = Graph()

let nodeA = graph.addNode("a")
let nodeB = graph.addNode("b")
let nodeC = graph.addNode("c")
let nodeD = graph.addNode("d")
let nodeE = graph.addNode("e")
let nodeF = graph.addNode("f")
let nodeG = graph.addNode("g")
let nodeH = graph.addNode("h")

graph.addEdge(nodeA, neighbour: nodeB)
graph.addEdge(nodeA, neighbour: nodeC)
graph.addEdge(nodeB, neighbour: nodeD)
graph.addEdge(nodeB, neighbour: nodeE)
graph.addEdge(nodeC, neighbour: nodeF)
graph.addEdge(nodeC, neighbour: nodeG)
graph.addEdge(nodeE, neighbour: nodeH)
graph.addEdge(nodeE, neighbour: nodeF)
graph.addEdge(nodeF, neighbour: nodeG)


let nodesExplored = breadthFirstSearch(graph, source: nodeA)
print(nodesExplored)
