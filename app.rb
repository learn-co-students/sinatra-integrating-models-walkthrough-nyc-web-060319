require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @text_from_user = params[:user_text]
    # @number_words = @text_from_user.split().length
    # @vowels = @text_from_user.count("aeiou")
    @analyzed_text = TextAnalyzer.new(@text_from_user)
    @most = @analyzed_text.most_used_letter
    erb :results
  end
end
