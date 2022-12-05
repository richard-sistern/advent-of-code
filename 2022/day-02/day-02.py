# Possible Game Outcomes

# | P1 | P2 | Result | Score       |
# |----|----|--------|-------------|
# | A  | X  | Draw   | (1 + 3) = 4 |
# | A  | Y  | Win    | (2 + 6) = 8 |
# | A  | Z  | Loss   | (3 + 0) = 3 |
# | B  | X  | Loss   | (1 + 0) = 1 |
# | B  | Y  | Draw   | (2 + 3) = 5 |
# | B  | Z  | Win    | (3 + 6) = 9 |
# | C  | X  | Win    | (1 + 6) = 7 |
# | C  | Y  | Loss   | (2 + 0) = 2 |
# | C  | Z  | Draw   | (3 + 3) = 6 |

with open("input.txt") as f:
    lines = f.read().splitlines() 

outcomes = {
    "A X":4,
    "A Y":8,
    "A Z":3,
    "B X":1,
    "B Y":5,
    "B Z":9,
    "C X":7,
    "C Y":2,
    "C Z":6
}

score = 0

for line in lines:
    score += outcomes[line]

print(score)