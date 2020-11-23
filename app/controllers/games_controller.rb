class GamesController < ApplicationController
  def new
    @letters = []
    while @letters.length != 10
      @letters << ('A'..'Z').to_a.sample
    end
    @letters
  end

  def score
    @result = CalculateResult.new(params[:attempt], params[:grid]).call
    if session[:score]
      session[:score] += params[:attempt].size if @result.start_with?("Congratulation!")
    else
      session[:score] = params[:attempt].size if @result.start_with?("Congratulation!")
    end
  end
end
