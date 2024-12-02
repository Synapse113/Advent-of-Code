file = File.read("../inputs/day2.txt")

MAX_RED   = 12
MAX_GREEN = 13
MAX_BLUE  = 14

IDS = [] of Int32

def parse_line(l)
  rounds = l.gsub(',', "").split(/; |: /)
  game_id = rounds[0].scan(/[0-9]+/)[0][0]
  rounds.shift

  colors = {"red" => 0, "green" => 0, "blue" => 0}

  rounds.each do |r|
    cubes = r.split(/ /)

    cubes.each_with_index do |c, i|
      if c.size > 2
        if cubes[i - 1].to_i > colors[c]
          colors[c] = cubes[i - 1].to_i
        end
      end
    end
  end

  if colors["red"] <= MAX_RED && colors["blue"] <= MAX_BLUE && colors["green"] <= MAX_GREEN
    IDS << game_id.to_i
  end
end

file.each_line do |l|
  parsed = parse_line(l)
end

sum = IDS.sum

p! sum
