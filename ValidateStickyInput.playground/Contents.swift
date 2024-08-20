let name1 = "alex"
let input1 = "aaleex"

let name2 = "saeed"
let input2 = "ssaaedd"

func validateStickyInput(input: String, expected: String) -> Bool {
    // I know this is strange, but Swift does not allow indexing string to character via Int
    // this mean indexing string is safer in swift but more steps
    var index: String.Index = expected.startIndex
    var previousCharacter: Character? = nil
    for character in input {
        let targetCharacter = expected[index]
        if character != targetCharacter {
            if character == previousCharacter {
                continue
            }
            return false
        }
        
        if expected.index(after: index) < expected.endIndex {
            previousCharacter = targetCharacter
            index = expected.index(after: index)
        }
    }
    
    return index != expected.endIndex
}


print("alex: ", validateStickyInput(input: input1, expected: name1))
print("saeed: ", validateStickyInput(input: input1, expected: name2))
