def calorific_counter(lines, slice_by = 1):
    elves = []
    current_elf = 0

    for line in lines:
        if line == '\n':
            elves.append(current_elf) # Add current elf ➕
            current_elf = 0 # Kill current elf 💀
        else:
            current_elf += int(line) # Add calories 🎂
    elves.sort(reverse=True)
    
    return elves[:slice_by]

file = open("input.txt", "r")
lines = file.readlines()

result = calorific_counter(lines)
print(f'Part 1 result: {result}')

result = sum(calorific_counter(lines, 3))
print(f'Part 2 result: {result}')


