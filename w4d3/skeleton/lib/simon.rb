class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !game_over
      take_turn
      sleep(1)
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !game_over
      round_success_message
      @sequence_length += 1
    end
    sleep(1)
    system("clear")
  end

  def show_sequence
    add_random_color
    seq.each do |x|
      system("clear")
      puts x
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    seq.each do |x|
      system("clear")
      input = gets.chomp
      sleep(0.5)
      if input != x
        @game_over = true
        return
      end
      system("clear")
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "you won this time..."
  end

  def game_over_message
    puts "you suck, try again"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
