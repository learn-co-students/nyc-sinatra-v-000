<!DOCTYPE HTML>
<html>
<head>
<title>Figures</title>
</head>
<body>
<form method="/figures/index" action="get">
<label>List of all Figures</label>
<% @figures.each do |figure| %>
  <li>
  <%= figure.name %>
  </li>
  <% end %>
</form>
</body>
</html>
