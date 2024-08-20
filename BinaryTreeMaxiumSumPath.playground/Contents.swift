import Foundation

final class Node {
    init(_ number: Int, lhs: Node? = nil, rhs: Node? = nil) {
        self.number = number
        self.lhs = lhs
        self.rhs = rhs
    }
    
    let number: Int
    let lhs: Node?
    let rhs: Node?
}

let simpleTree = Node(1, lhs: Node(2), rhs: Node(3))

let tree = Node(10,
                lhs: Node(2,
                          lhs: Node(20),
                          rhs: Node(1)),
                rhs: Node(10,
                          rhs: Node(-25,
                                     lhs: Node(3),
                                     rhs: Node(4))))


func resolveMPS(_ root: Node?, hasAncestor: Bool) -> Int {
    guard let root else {
        return 0
    }
    
    let lhsResult = resolveMPS(root.lhs ?? nil, hasAncestor: true)
    let rhsResult = resolveMPS(root.rhs ?? nil, hasAncestor: true)
    
    let result = max(root.number, root.number + max(lhsResult, rhsResult))
 
    return hasAncestor ? result : max(result, root.number + lhsResult + rhsResult)
}


func resolveMPS(_ node: Node?) -> Int {
    resolveMPS(node, hasAncestor: false)
}

print("Resolve: ", resolveMPS(tree))
print("Resolve (simple): ", resolveMPS(simpleTree))

