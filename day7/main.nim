import strutils
import sequtils

type
    node = object
        value: int
        folders: seq[node]

var fs = newSeqWith(1, newSeq[int](1))
var indent = 0
var row = 0

var currentSize = 0
var lastCd: string

for line in "input.txt".lines():
    let tokenizedLine = line.split(' ')
    if tokenizedLine[0] == "$":
        if tokenizedLine[1] == "cd":
            echo line
            case tokenizedLine[2]:
                of "..":
                    dec indent
                else:
                    if lastCd == "..":
                        fs[indent].add(0)
                        inc row
                    else:
                        fs.add(newSeq[int](1))
                        inc indent
            lastCd = tokenizedLine[2]
            echo fs
    elif tokenizedLine[0] == "dir":
        discard
    else:
        echo "indent: ", indent, "\trow: ", row
        fs[indent][row] += parseInt(tokenizedLine[0])
    
for ind in 0 .. fs.len - 1:
    for row in 0 .. fs[ind].len - 1:
        echo fs[ind][row]

