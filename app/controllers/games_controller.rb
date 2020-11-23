class GamesController < ApplicationController
  def new
    @letters = []
    while @letters.length != 10
      @letters << ('A'..'Z').to_a.sample
    end
    @letters
  end

  def score
    @user_attempt = params[:attempt]
    dictionnary_verif = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@user_attempt}").read)
  end
end
