import strutils
import sequtils

var stack1 = @['F', 'C', 'J', 'P', 'H', 'T', 'W']
var stack2 = @['G', 'R', 'V', 'F', 'Z', 'J', 'B', 'H']
var stack3 = @['H', 'P', 'T', 'R']
var stack4 = @['Z', 'S', 'N', 'P', 'H', 'T']
var stack5 = @['N', 'V', 'F', 'Z', 'H', 'J', 'C', 'D']
var stack6 = @['P', 'M', 'G', 'F', 'W', 'D', 'Z']
var stack7 = @['M', 'V', 'Z', 'W', 'S', 'J', 'D', 'P']
var stack8 = @['N', 'D', 'S']
var stack9 = @['D', 'Z', 'S', 'F', 'M']

var stacks = [stack1, stack2, stack3, stack4, stack5, stack6, stack7, stack8, stack9]

let input = readFile("input.txt").splitLines()

# for line in input:
#     let tokenized = line.split(' ')
#     let crates = parseInt(tokenized[1])
#     let ffrom = parseInt(tokenized[3]) - 1
#     let tto = parseInt(tokenized[5]) - 1
#     for i in 1 .. crates:
#         stacks[tto].add(stacks[ffrom][^1])
#         stacks[ffrom].delete(stacks[ffrom].len - 1)

# echo "Part 1: ", stacks

for line in input:
    let tokenized = line.split(' ')
    let crates = parseInt(tokenized[1])
    let ffrom = parseInt(tokenized[3]) - 1
    let tto = parseInt(tokenized[5]) - 1
    
    let length1 = stacks[ffrom].len - 1
    var cratesToBeMoved = stacks[ffrom][length1-crates+1 .. length1]
    stacks[tto] = concat(stacks[tto], cratesToBeMoved)
    stacks[ffrom].delete(length1 - crates + 1 .. length1)

echo "Part 2: ", stacks