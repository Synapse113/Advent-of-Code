file = File.read("../inputs/day1.txt")
sum = 0

DIGITS = {"one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9"}

def convert_to_num(word)
  if word.size > 1
    	return DIGITS[word]
  end

  return word
end

file.each_line do |l|
  pattern = DIGITS.keys.join("|") + "|" + DIGITS.values.join("|")
  matches = l.scan(/(?=(#{pattern}))/m)

  sum += (convert_to_num(matches[0][1]) + convert_to_num(matches[-1][1])).to_i
end

p! sum
