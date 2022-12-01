import strutils

let input = readFile("input.txt")

var lines = input.splitLines();

var sums = newSeq[int](0);

var sum = 0;
for line in lines:
    if line != "":
        sum += parseInt(line)
    else:
        sums.add(sum)
        sum = 0

var big0 = 0
for sum in sums:
    if sum > big0:
        big0 = sum

var big1 = 0
for sum in sums:
    if sum > big1 and sum != big0:
        big1 = sum

var big2 = 0
for sum in sums:
    if sum > big2 and sum != big0 and sum != big1:
        big2 = sum

echo("Part 1: ", big0)
echo("Part 2: ", big0+big1+big2)
