<%Landmark.All.each do |landmark| %>
    <label for="landmark.name"><%=landmark.name%></label>
    <input type="text"
     name="figure[landmark_ids][]"
     id="<%=landmark.name%>" 
     value="<%=landmark.id%>" >
    <%end%>