let i1 = [2, 4, 3]
let i2 = [5, 6, 4]
let l1 = [9, 9, 9, 9, 9, 9, 9]
let l2 = [9, 9, 9, 9]

func toReversedInt(_ list: [Int]) -> Int {
    var result = 0
    var i = 1
    for l in list {
        result += l * i
        i = i * 10
    }
    return result
}

func toReversedList(_ i: Int) -> [Int] {
    var result = [Int]()
    var i = i
    
    repeat {
        result.append(i % 10)
        i = i / 10
    } while i > 0
    return result
}

func resolve(_ l1: [Int], _ l2: [Int]) -> [Int] {
    let d1 = toReversedInt(l1)
    let d2 = toReversedInt(l2)
    return toReversedList(d1 + d2)
}

print(resolve(i1, i2))
print(resolve(l1, l2))
