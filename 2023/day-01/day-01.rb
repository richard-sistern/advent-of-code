#!/usr/bin/env ruby
class Day
    DIGITS = %w(one two three four five six seven eight nine)
        .map.with_index
        .to_a.to_h
        .transform_values { _1 + 1 }

    def initialize(input)
        @input = input.split("\n")
    end

    def part1
        @input.sum { _1.scan(/\d/).values_at(0, -1).join.to_i }
        # .sum : Iterate over each element and calculate the sum of the values returned by the block
        # _1.scan(/\d/) : Scan the current line (_1) and extract all digits
        # .values_at(0, -1) : Select the first and last elements
        # .join.to_i : Joins the selected digits into a string, then converts to an integer
    end

    def part2  
        @input.sum {
            _1.scan(/(?=(#{DIGITS.keys.join("|")}|\d))/)
            .flatten
            .values_at(0, -1)
            .map { |match| DIGITS[match] || match }
            .join
            .to_i
        }
    end
end

if $PROGRAM_NAME == __FILE__
    file_path = File.expand_path("../day-01-input.txt", __FILE__)
    input     = File.read(file_path)
    
    puts "Part 1: #{Day.new(input).part1}"

    puts "Part 2: #{Day.new(input).part2}"
end