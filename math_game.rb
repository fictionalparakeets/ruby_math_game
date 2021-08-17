require './player'
require './questions'

class Math_Game
  def run_game
    question_count = 0
    game_questions = []

    puts "Player 1, what's your name?"
    @player1 = Player.new(gets.chomp)

    puts "Player 2, what's your name?"
    @player2 = Player.new(gets.chomp)

    loop do
      whos_turn = question_count.even? ? @player1 : @player2
      player = whos_turn.name
      puts ''
      puts "It's #{player}'s turn to go"
      question = Questions.new

      game_questions << question.give_question
      puts ''

      puts game_questions[question_count][0]
      answer = gets.chomp.to_i
      puts ''

      game_questions[question_count].push(answer)
      if game_questions[question_count][1] == answer

        if whos_turn == @player1
          puts "Correct answer from #{@player1.name}"
          @player1.add_point
          game_questions[question_count].push(@player1.name)

        elsif whos_turn == @player2
          puts "Correct answer from #{@player2.name}"
          @player2.add_point
          game_questions[question_count].push(@player2.name)
        end

      else
        puts "That's an incorrect answer!"
      end

      puts "#{@player1.name}'s score: #{@player1.score}"
      puts "#{@player2.name}'s score: #{@player2.score}"

      question_count += 1

      break if @player1.score >= 3 || @player2.score >= 3
    end

    winner = @player1.score == 3 ? @player1.name : @player2.name

    puts ''
    puts '#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#'
    puts ''
    puts "#{winner} won the game!"
    puts ''
    puts '#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#'
    puts ''

    puts 'Would you like to review the game questions? (y/n)'
    review = gets.chomp.downcase
    if review == 'y'
      question_num = 1
      game_questions.each do |question_set|
        puts '-------------------------------------'
        puts "Question #{question_num}"
        puts question_set[0]
        puts "Correct Answer: #{question_set[1]}"
        puts "#{question_set[3]}'s' Answer: #{question_set[2]}"
        question_num += 1
      end
    end

    puts ''
    puts 'Thanks for playing. Goodbye!'
  end
end
