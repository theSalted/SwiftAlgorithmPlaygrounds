final class Node {
    init(_ number: Int, lhs: Node? = nil, rhs: Node? = nil) {
        self.number = number
        self.lhs = lhs
        self.rhs = rhs
    }
    
    let number: Int
    let lhs: Node?
    let rhs: Node?
} // SAME as Q1

let simpleTree = Node(1, lhs: Node(2), rhs: Node(3))

let tree = Node(10,
                lhs: Node(5,
                          lhs: Node(3),
                          rhs: Node(7)),
                rhs: Node(15,
                          rhs: Node(18)))

let tree2 = Node(10,
                lhs: Node(5,
                          lhs: Node(3,
                                    lhs: Node(1)),
                          rhs: Node(7,
                                    lhs: Node(6))),
                rhs: Node(15,
                          lhs: Node(13),
                          rhs: Node(18)))

func inclusiveSum(_ root: Node?, min: Int, max: Int) -> Int {
    assert(min <= max)
    guard let root else {
        return 0
    }
    let rootNum = (root.number >= min && root.number <= max) ? root.number : 0
    let lhsSum = inclusiveSum(root.lhs, min: min, max: max)
    let rhsSum = inclusiveSum(root.rhs, min: min, max: max)
    return lhsSum + rhsSum + rootNum
}

print(inclusiveSum(tree, min: 7, max: 15))
print(inclusiveSum(tree2, min: 6, max: 10))
