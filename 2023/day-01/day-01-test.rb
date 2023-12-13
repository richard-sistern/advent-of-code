require "minitest/autorun"
require_relative "day-01"

class DayTest < Minitest::Test
    def test_part_1
        input = %Q(
            1abc2
            pqr3stu8vwx
            a1b2c3d4e5f
            treb7uchet
        )

        assert_equal 142, Day.new(input).part1
    end

    def test_part_2
        input = %Q(
            two1nine
            eightwothree
            abcone2threexyz
            xtwone3four
            4nineeightseven2
            zoneight234
            7pqrstsixteen
        )

        assert_equal 281, Day.new(input).part2
    end

end