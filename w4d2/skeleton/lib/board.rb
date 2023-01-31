class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @current_player_name = name1
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |x, i|
      if i != 6 && i != 13
        x.push(:stone, :stone, :stone, :stone)
      end
    end
  end

  def valid_move?(start_pos)
    starts = (0..5).to_a + (7..12).to_a
    if !starts.include?(start_pos)
      raise "Invalid starting cup"
    end
    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    i = 1
    next_pos = 0
    until cups[start_pos].empty?
      next_pos = (start_pos + i) % 13
      if (@current_player_name == @name1 && next_pos == 13) || (@current_player_name == @name2 && next_pos == 6)
        next
      end
      cups[next_pos] << cups[start_pos].pop
      i += 1
      # p (start_pos + i) % 13
    end
    # p (start_pos + i) % 13
    p cups[next_pos]
    render
    next_turn(next_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if cups[ending_cup_idx].length == 1
      return :switch
    end
    if (ending_cup_idx == 6 && @current_player_name == @name1) || (ending_cup_idx == 13 && @current_player_name == name2)
      return :prompt
    end
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
