def sluggish_octopus(fishes)
    longest_fish = fishes[0]
    (0...fishes.length).each do |i1|
        (i1 + 1...fishes.length).each do |i2|
            if fishes[i1].length > fishes[i2].length
                longest_fish = fishes[i1]
            else
                longest_fish = fishes[i2]
            end
        end
    end
    longest_fish
end

def dominant_octopus(fishes)
    merge_octopus(fishes)[0]
end

def merge_octopus(arr)
    return arr if arr.length <= 1
    mid = arr.length / 2
    left = merge_octopus(arr[0...mid])
    right = merge_octopus(arr[mid..-1])
    merge(left, right)
end

def merge(left, right)
    merge = []
    until left.empty? || right.empty?
        if left[0].length > right[0].length
            merge << left.shift
        else
            merge << right.shift
        end
    end
    merge + left + right
end

def clever_octopus(fishes)
    max = fishes[0]
    fishes.each do |x|
        max = x if x.length > max.length
    end
    max
end

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
    'fiiiissshhhhhh']

# p sluggish_octopus(fishes)

# p merge_octopus(fishes)
# p dominant_octopus(fishes)

# p clever_octopus(fishes)


def slow_dance(move, tiles_array)
    tiles_array.each_with_index {|x, i| return i if x == move }
end

def fast_dance(move, tiles_hash)
    tiles_hash[move]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
    "left",  "left-up"]

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

tiles_hash = {
    'up' => 0,
    'right_up' => 1,
    "right" => 2,
    "right-down" => 3,
    "down"=> 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)