# This file will require all the other files

require 'pry'

require './player'
require './math_game'
require './questions'

first_game = Math_Game.new
first_game.run_game
