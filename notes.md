<% Title.all.each do |title| %>
<p><%= title.name %><input id="<%= title.name %>" type="checkbox" name="title_ids[]" value="<%= title.id %>"></p>
<% end %>


Figure.all.select{|i| i unless i.name}.each do |artist| artist.destroy end


get '/figures/:id' do
  @figure = Figure.find(params[:id])
  erb :'/figure/show'
end

 post '/figure/:id' do
  @figure = Figure.find(params[:id])
#  @figure.update(params["figure"])
  if !params["owner"]["name"].empty?
  #  @figure.title = Title.create(params["title"])
  end
  @figure.save
  redirect "figure/#{@figure.id}"
end




<% Landmark.all.each do |landmark| %>

<p><%= landmark.name %><input id="<%= landmark.name %>" type="checkbox" name="landmark[]" value="<%= landmark.id %>"<%='checked' if @figure.landmarks.include?(landmark) %>></p>
<% end %>
