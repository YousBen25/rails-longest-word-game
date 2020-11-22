class GamesController < ApplicationController
  def new
    @letters = []
    while @letters.length != 10
      @letters << ('A'..'Z').to_a.sample
    end
    @letters
  end

  def score
  end
end
