import strutils

let input = readFile("input.txt")

var lines = input.splitLines();
lines.del(lines.len - 1)
var score = 0

for line in lines:
    var game = line.splitWhitespace()
    var o = game[0]
    var p = game[1]

    if o == "A":
        if p == "X":
            score += 4
        elif p == "Y":
            score += 8
        else:
            score += 3
    elif o == "B":
        if p == "X":
            score += 1
        elif p == "Y":
            score += 5
        else:
            score += 9
    else:
        if p == "X":
            score += 7
        elif p == "Y":
            score += 2
        else:
            score += 6

echo("Part1: ", score)

const lose = "X"
const draw = "Y"
const win = "Z"

score = 0

for line in lines:
    var game = line.splitWhitespace()
    var o = game[0]
    var outcome = game[1]

    if outcome == lose:
        if o == "A":
            score += 3
        elif o == "B":
            score += 1
        else:
            score += 2
    elif outcome == draw:
        if o == "A":
            score += 4
        elif o == "B":
            score += 5
        else:
            score += 6
    elif outcome == win:
        if o == "A":
            score += 8
        elif o == "B":
            score += 9
        else:
            score += 7

echo("Part2: ", score)