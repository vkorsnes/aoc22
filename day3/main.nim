import strutils

let input = readFile("input.txt")
let lines = input.splitLines()

proc createCommonElementsString(a, b: var string): string =
    for i in 0 .. a.len - 1:
        for j in 0 .. b.len - 1:
            if a[i] == b[j]:
                result.add(a[i])
                a[i] = '0'
                b[j] = '1'

    return result


var sum = 0
for line in lines:
    let length = line.len div 2
    var first = line[0 .. length - 1]
    var second = line[length .. length*2 - 1]

    let common = createCommonElementsString(first, second)
    
    let chars = common.splitLines()

    for line in chars:
        if line[0].isLowerAscii():
            # echo int(line[0]) - 96
            sum += int(line[0]) - 96
        else:
            # echo int(line[0]) - 38
            sum += int(line[0]) - 38

echo "Part 1: ", sum

iterator countByXtoY(x, y: int): int =
    var i = 0
    while i < y:
        yield i
        i += x

sum = 0
for i in countByXtoY(3,lines.len):
    var first = lines[i]
    var second1 = lines[i+1]
    var second2 = lines[i+1]
    var third = lines[i+2]

    var com1 = createCommonElementsString(first, second1)
    var com2 = createCommonElementsString(third, second2)

    var final = createCommonElementsString(com1, com2)

    if final[0].isLowerAscii():
        sum += int(final[0]) - 96
    else:
        sum += int(final[0]) - 38

echo "Part 2: ", sum