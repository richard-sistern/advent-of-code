#!/usr/bin/env ruby
class Day
    def initialize(input)
        @input = input.split("\n")
    end

    # 12 red cubes, 13 green cubes, and 14 blue cubes
    def part1 (max_blue, max_green, max_red)
       @input
        .sum {
            blue = _1.scan(/(\d+) blue/).flatten.map(&:to_i).max
            green = _1.scan(/(\d+) green/).flatten.map(&:to_i).max
            red = _1.scan(/(\d+) red/).flatten.map(&:to_i).max

            if blue > max_blue || green > max_green || red > max_red
                0
            else
                _1.scan(/Game (\d*)/).flatten.first.to_i
            end
        }
       
    end

    def part2  
       @input
    end
end

if $PROGRAM_NAME == __FILE__
    file_path = File.expand_path("../day-02-input.txt", __FILE__)
    input     = File.read(file_path)
    
    puts "Part 1: #{Day.new(input).part1(14, 13, 12)}"
end

