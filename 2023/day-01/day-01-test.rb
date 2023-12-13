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
end