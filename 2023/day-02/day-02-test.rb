require "minitest/autorun"
require_relative "day-02"

class DayTest < Minitest::Test
    def test_part_1
        input = %Q(
            Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
            Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
            Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
            Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
            Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        ).strip

        assert_equal 142, Day.new(input).part1(14, 13, 12)
    end

    # def test_part_2
    #     input = %Q(
    #         two1nine
    #         eightwothree
    #         abcone2threexyz
    #         xtwone3four
    #         4nineeightseven2
    #         zoneight234
    #         7pqrstsixteen
    #     )

    #     assert_equal 281, Day.new(input).part2
    # end

end