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

def part_1(games):
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

    for game in games:
        score += outcomes[game]

    return(score)

# X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win
def part_2(games):
    outcomes = {
        "A X":3,
        "A Y":4,
        "A Z":8,
        "B X":1,
        "B Y":5,
        "B Z":9, 
        "C X":2,
        "C Y":6,
        "C Z":7 
    }

    score = 0

    for game in games:
        score += outcomes[game]

    return(score)


with open("input.txt") as f:
    games = f.read().splitlines()

    result = part_1(games)
    print(f'Part 1 result: {result}')

    result = part_2(games)
    print(f'Part 2 result: {result}')

