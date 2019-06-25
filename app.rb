require_relative 'config/environment'
require_relative 'models/text_analyzer.rb' 
# gives us the ability to create new instances of the 
# TextAnalyzer class from within our controller.


class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
  	# text_from_user = params[:user_text]
 	# @analyzed_text = TextAnalyzer.new(text_from_user)
 	@analyzed_text = TextAnalyzer.new(params[:user_text])


    erb :results 		#renders the results page

  end
end
