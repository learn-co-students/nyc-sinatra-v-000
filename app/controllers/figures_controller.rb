class FiguresController < ApplicationController
  
  get '/figures' do 
    erb :'/figures/index' 
  end
  
  get '/figures/new' do 
    
    erb :'/figures/new' 
  end
  
  post '/figures' do 
    
    redirect "/figures/#{@figure.name}"
  end
  
  get '/figures/:name' do 
    
    erb :'/figures/show'
  end
  
  get '/figures/:name/edit' do 
    
    erb :'/figures/edit' 
  end
  
end
