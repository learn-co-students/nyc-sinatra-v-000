class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"application/index"
  end

  helpers do
    def all_figures
      Figure.all
    end

    def all_landmarks
      Landmark.all
    end

    def all_titles
      Title.all
    end
  end
end
