def part1(lines):
    best_elf = 0
    current_elf = 0

    for line in lines:
        if line == '\n':
            if current_elf > best_elf:
                best_elf = current_elf
            current_elf = 0 # Kill the elf!!!
        else:
            current_elf += int(line)

    return best_elf
           

file = open("input.txt", "r")
result = part1(file.readlines())

print(f'Part 1 result: {result}')
