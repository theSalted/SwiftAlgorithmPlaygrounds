
let S = "abcdebdde"
let T = "bcde"

func minSubsequence(_ S: String, _ T: String) -> String {
    var indexT = T.startIndex
    let firstT = T[T.startIndex]
    var allHit = false
    
    var minSubSeq = ""
    var buffer = ""
    for character in S {
        if indexT == T.endIndex {
            if buffer.count < minSubSeq.count || minSubSeq.count < T.count {
                minSubSeq = buffer
            }
            allHit = true
            buffer = ""
            indexT = T.startIndex
        }
        
        if !buffer.isEmpty && character == firstT && indexT == T.index(after:T.startIndex) {
            buffer = ""
            indexT = T.startIndex
        }
        
        if character == T[indexT] {
            buffer.append(String(character))
            indexT = T.index(after: indexT)
        } else if !buffer.isEmpty {
            buffer.append(String(character))
        }
    }
    
    return allHit ? minSubSeq : ""
}

print("result: ", minSubsequence(S, T))
