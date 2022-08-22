require 'open-uri'

class GamesController < ApplicationController
  def new
    alphabet = ('A'..'Z').to_a
    @letters = []
    x = 10
    until x.zero?
      @letters.push(alphabet.sample)
      x -= 1
    end
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    json_string = URI.open(url).read
    @word_check = JSON.parse(json_string)
  end
end
