import string
alphabet = string.ascii_lowercase + string.ascii_uppercase

def part_1(rucksacks):
    total_priorities = 0

    for rucksack in rucksacks:
        half = int(len(rucksack)/2)
        compartment_one, compartment_two = rucksack[:half], rucksack[half:]
        
        # Find common letters between sets found using the & operator
        # Pop as should only ever be one and index requires a string
        duplicate_item = list(set(compartment_one) & set(compartment_two)).pop(0) 
        total_priorities += alphabet.index(str(duplicate_item)) + 1

    return total_priorities

def part_2(rucksacks):
    total_priorities = 0

    # Group rucksacks into groups of 3
    groups = [rucksacks[i:i + 3] for i in range(0, len(rucksacks), 3)]
    
    for group in groups:
        badge = list(set(group[0]) & set(group[1]) & set(group[2])).pop(0)

        total_priorities += alphabet.index(str(badge)) + 1

    return total_priorities


with open("input.txt") as f:
    rucksacks = f.read().splitlines()

    result = part_1(rucksacks)
    print(f'Part 1 result: {result}')

    result = part_2(rucksacks)
    print(f'Part 2 result: {result}')

   
    

  