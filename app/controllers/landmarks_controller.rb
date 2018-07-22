class LandmarksController < ApplicationController
 get 'landmarks/new' do
   erb :'landmark/new'
 end
end
