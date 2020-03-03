class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end 

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    result = []
    @secret_word.each_char.with_index do |c, i|
      result << i if c == char
    end
    result
  end

  def fill_indices(char, array)
    @guess_word = @guess_word.each_with_index.map do |e, i|
      array.include?(i)? char : e
    end
  end

  def try_guess(char)
    ((puts "that has already been attempted"); (return false)) if already_attempted?(char)
    fill_indices(char, get_matching_indices(char))
    @remaining_incorrect_guesses -= 1 if !@guess_word.include?(char)
    @attempted_chars << char
    true
  end

  def ask_user_for_guess
    p "Enter a char:"
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      false
    end
  end
end
