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




figures/edit.erb
<h1>Edit historical figure</h1>

<form action="/figures/<%= @figure.slug %>" method="post">
    <input id="hidden" type="hidden" name="_method" value="patch"></input>

    <h3><%= @figure.name %></h3>

    Name: <input type="text" id="figure_name" name="figure[name]" value="<%= @figure.name %>">
    <h4>Update title: </h4>
    <% Title.all.each do |title| %>
        <input type="checkbox" id="title_<%=title.id %>" name="figure[title_ids][]"value="<%= title.id %>" <%"checked" if @figure.titles.include?(title) %>><%=title.name %></input>
    <% end %>

    <h4>Choose or create a new landmark: </h4>
    <% Landmark.all.each do |landmark| %>
        <input type="checkbox" id="landmark_<%=landmark.id%>" name="figure[landmark_ids][]" value="<%=landmark.id%>" <%="checked" if @figure.landmarks.include?(landmark)%>><%=landmark.name%></input>
    <% end %>
</br>
</br>
    New landmark name:  <input type="text" id="new_landmark" name="landmark[name]"></br>
    New landmark - year completed:  <input type="text" id="new_year_complete" name="landmark[year_completed]">
    </br>
    </br>
    <input type="submit" value="Edit Figure">
    </br>
    <h2>Create a new figure</h2>
    New figure name: <input type="text" name="figure[name]" id="figure_name" value=""></br>
    New figure title: <input type="text" name="figure[title]" id="figure_title" value=""></br>
    New figure landmark: <input type="text" name="figure[landmark]" id="figure_landmark" value=""></br>

</br>

</form>

<a class="button" href="/figures">Figures</a>
<a class="button" href="/">Home</a>









<!---<h2>Title</h2></br>
<% Title.all.each do |title| %>
     <input type="checkbox" name="figure[title_ids][]" value="<%= @title.id %>"><%= title.name %></br>
<% end %>
-->

<!--<h2> Create New Title: </h2>
<input type="text" name="title[name]" value="@title.name">
-->

<!--
<h2>Landmarks</h2>
<% Landmark.all.each do |landmark| %>
     <input type="checkbox" name="figure[landmark_ids][]" value="<%= @landmark.id %>"><%= landmark.name %></br>
<% end %>
-->

<!--
<h2>Create New Landmark </h2>
<label>Name: </label>
    <input type="text" name="landmark[name]">
<label>Year: </label>
    <input type="text" name="landmark[year_completed]">
-->
