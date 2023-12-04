package main

import "testing"

func TestPart1(t *testing.T) {
	input := "1abc2" +
		"pqr3stu8vwx" +
		"a1b2c3d4e5f" +
		"treb7uchet"

	result := part1(input)
	expected := 142

	if result != expected {
		t.Errorf("Part 1 returned %d, expected %d", result, expected)
	}
}
