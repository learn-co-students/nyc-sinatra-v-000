post 'figures' do
@figure = Figure.create(params[:figure])
if !params[:landmark][:name].empty?
    @figure.landmarks << Landmark.create(params[:landmark])
end
if !params[:title][:name].empty?
    @figure.titles << Title.create(params[:title])
end
@figure.save
redirect to("/figures/#{@figure.id}")



<label for="name">Figure Name: </label>
<input type="text" name="figure[name]" id="figure_name"value="<%= @figure.name%>">

<label for="landmark_name">Landmark Name: </label>
<input type="text" name="landmark[figure]" id="figure_name" value="<%=@figure.landmark.name %>">

<% Title.all.each do |t| %>
    <input type="checkbox" name="figure[title_ids][]" value="<%= title.id %>" <%='checked' if @figure.titles.include?(title) %>><%= title.name %>
