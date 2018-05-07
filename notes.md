<% Title.all.each do |title| %>
<p><%= title.name %><input id="<%= title.name %>" type="checkbox" name="title_ids[]" value="<%= title.id %>"></p>
<% end %>


Figure.all.select{|i| i unless i.name}.each do |artist| artist.destroy end
