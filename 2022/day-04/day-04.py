def part1(assignments):
    overlaps = 0

    for assignment in assignments:
        left, right = assignment.split(",")

        left_start, left_end = [int(i) for i in left.split("-")]
        right_start, right_end = [int(i) for i in right.split("-")]

        if (left_start <= right_start and left_end >= right_end) or (right_start <= left_start and right_end >= left_end):
            overlaps += 1

    return overlaps

def part2(assignments):
    overlaps = 0

    for assignment in assignments:
        left, right = assignment.split(",")

        left_start, left_end = [int(i) for i in left.split("-")]
        right_start, right_end = [int(i) for i in right.split("-")]

        if right_end >= left_start >= right_start or left_end >= right_start >= left_start:
            overlaps += 1

    return overlaps

    aa, aaa = [int(r) for r in a.split("-")]
    bb, bbb = [int(r) for r in b.split("-")]

    if bbb >= aa >= bb or aaa >= bb >= aa:t+=1

with open("input.txt") as f:
    assignments = f.read().splitlines()

result1 = part1(assignments)
print(result1)

result2 = part2(assignments)
print(result2)
