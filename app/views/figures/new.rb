<!DOCTYPE HTML>
<html>
<head>
<title>Create a new Figure</title>
</head>
<body>
<form method="post" action="/figures">
<label>Figure Name:</label>
<br></br>
<input type="text"> name="figure[name]" id="figure_name"</input>
<br></br>
<label>Select a title below:</label>
<%= @titles.each do |title| %>
  <li>
<input type="checkbox" name="figure[title_ids][]" value="<%= title.id %>" id="<%= title.id %>"><%=title.name%></input>
</li>
<% end %>
<br></br>
<%= @landmarks.each do |landmark|%>
  <li>
  <input type="checkbox" name="landmark[figure_ids][]" value="<%= landmark.id" id="<%= landmark.id %>"><%=landmark.name%></input>
  </li>
<input type="submit" value="Create Figure">
</form>
</body>
</html>
