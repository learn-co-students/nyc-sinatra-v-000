Build a history site for NYC

Database Structure
 - 3 Models and corresponding tables 
   -- Landmark
   -- Title
   -- Figure 
- Landmark belongs to figure
- Figure has many landmarks 
- Titles and Figures have a many to many relationship, so use a join table