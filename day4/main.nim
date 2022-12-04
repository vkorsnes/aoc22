import strutils
import sequtils

let input = readFile("input.txt")
let pairs = input.splitLines()

var overlappingPairs = 0
for pair in pairs:
    let ab = pair.split(",")
    let aIntervalUnparsed = ab[0].split("-")
    let bIntervalUnparsed = ab[1].split("-")

    let aLower = parseInt(aIntervalUnparsed[0])
    let aUpper = parseInt(aIntervalUnparsed[1])
    let bLower = parseInt(bIntervalUnparsed[0])
    let bUpper = parseInt(bIntervalUnparsed[1])

    if aLower >= bLower and aUpper <= bUpper:
        overlappingPairs += 1
    elif bLower >= aLower and bUpper <= aUpper:
        overlappingPairs += 1

echo "Part 1: ", overlappingPairs


overlappingPairs = 0
for pair in pairs:
    let ab = pair.split(",")
    let aIntervalUnparsed = ab[0].split("-")
    let bIntervalUnparsed = ab[1].split("-")

    let aLower = parseInt(aIntervalUnparsed[0])
    let aUpper = parseInt(aIntervalUnparsed[1])
    let bLower = parseInt(bIntervalUnparsed[0])
    let bUpper = parseInt(bIntervalUnparsed[1])

    if aUpper >= bLower and aLower <= bUpper:
        overlappingPairs += 1
    # elif aLower >= bLower and aUpper <= bUpper:
    #     overlappingPairs += 1
    # elif bLower >= aLower and bUpper <= aUpper:
    #     overlappingPairs += 1

echo "Part 2: ", overlappingPairs

# ###[    ]##
# #[  ]######