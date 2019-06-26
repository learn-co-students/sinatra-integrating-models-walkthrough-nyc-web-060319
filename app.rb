require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base  #index.erb has input/name='user_text' which takes user-inputted-string
  get '/' do  #index.erb also has form which will take that input and put it into params
    erb :index #Form will POST to /, meaning  the post '/' do has access to params
  end

  post '/' do #post is called by Form on /, so this method has access to params
    # text_from_user = params[:user_text] #Get the user-submitted-text by calling on the params[:user_text] key
      @analyzed_text = TextAnalyzer.new(params[:user_text]) #Set new TextAnalyzer instance to an instance variable so results.erb can use it
    erb :results #Throw results of results.erb which can still access @analyzed_text
                 #We are RENDERING result.erb here, this is not a get request, rather we are just showing result.erb's HTML 
  end
end
