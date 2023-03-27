def part1(assignments):
    overlaps = 0

    for assignment in assignments:
        left, right = assignment.split(",")

        left_start, left_end = [int(i) for i in left.split("-")]
        right_start, right_end = [int(i) for i in right.split("-")]

        if (left_start <= right_start and left_end >= right_end) or (right_start <= left_start and right_end >= left_end):
            overlaps += 1

    return overlaps



with open("input.txt") as f:
    assignments = f.read().splitlines()

result = part1(assignments)
print(result)
