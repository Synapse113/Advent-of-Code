file = File.read("day3.txt")

sum = 0

schematic = file.split("\n")

def out_of_bounds(s, row, column)
  if row < 0 || column < 0 || row >= s.size || column >= s[column].size
    return true
  end

  return false
end

def check_left(s, row, column)
  if out_of_bounds(s, row - 1, column)
    return true
  end

  char = s[column][row - 1].to_s
  return char == "." || char =~ /[0-9]/
end

def check_right(s, row, column)
  if out_of_bounds(s, row + 1, column)
    return true
  end

  char = s[column][row + 1].to_s
  return char == "." || char =~ /[0-9]/
end

def check_above(s, row, column)
  if out_of_bounds(s, row, column - 1)
    return true
  end

  char = s[column - 1][row].to_s
  return char == "." || char =~ /[0-9]/
end

def check_below(s, row, column)
  if out_of_bounds(s, row, column + 1)
    return true
  end

  char = s[column + 1][row].to_s
  return char == "." || char =~ /[0-9]/
end

def check_top_left(s, row, column)
  if out_of_bounds(s, row - 1, column - 1)
    return true
  end

  char = s[column - 1][row - 1].to_s
  return char == "." || char =~ /[0-9]/
end

def check_top_right(s, row, column)
  if out_of_bounds(s, row + 1, column - 1)
    return true
  end

  char = s[column - 1][row + 1].to_s
  return char == "." || char =~ /[0-9]/
end

def check_bottom_left(s, row, column)
  if out_of_bounds(s, row - 1, column + 1)
    return true
  end

  char = s[column + 1][row - 1].to_s
  return char == "." || char =~ /[0-9]/
end

def check_bottom_right(s, row, column)
  if out_of_bounds(s, row + 1, column + 1)
    return true
  end

  char = s[column + 1][row + 1].to_s
  return char == "." || char =~ /[0-9]/
end

def check_neighbors(s, row, column)
  if check_left(s, row, column) && check_right(s, row, column) && check_above(s, row, column) && check_below(s, row, column) && check_top_left(s, row, column) && check_top_right(s, row, column) && check_bottom_left(s, row, column) && check_bottom_right(s, row, column)
    return true
  end
end

schematic.each_with_index do |l, i|
  l.each_char_with_index do |c, j|
    row = j
    column = i
    char = c.to_s

    if char =~ /[0-9]/
      puts c
      if check_neighbors(schematic, row, column)
        puts "bad"
      else
        puts "good"
      end
    end
  end
end
