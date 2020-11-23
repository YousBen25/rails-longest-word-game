require 'open-uri'
require 'json'

class CalculateResult
  def initialize(attempt, grid)
    @attempt = attempt
    @grid = grid
  end

  def call
    dictionnary_verif = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@attempt}").read)["found"]
    @grid = @grid.split(' ')
    truthy_array = @grid.map do |gridletter|
      @attempt.upcase.split('').any? { |letter| gridletter.include? letter }
    end
    @is_it_true = truthy_array.count(true) >= @attempt.size
    @result = ''
    if dictionnary_verif && @is_it_true
      @result = "Congratulation! #{@attempt} is a valid english word"
    elsif !dictionnary_verif
      @result = "Sorry but #{@attempt} is not an english word"
    else
      @result = "Its like #{@attempt} can't be built out of #{params['grid']}"
    end
    @result
  end
end
