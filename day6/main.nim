import strutils
import sequtils

let input = readFile("input.txt")

iterator countByXtoY(x, y: int): int =
    var i = 0
    while i < y:
        yield i
        i += x

for i in countByXtoY(1, input.len):
    let slice = input[i .. i+13]
    echo slice
    let s = deduplicate(slice)
    if s.len == 14:
        echo i+14
        break