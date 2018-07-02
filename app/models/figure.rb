class Figure < ActiveRecord::Base
  #has_many landmarks
  has_many :landmarks
  #many-to-many with figures (need join table)
  has_many :figure_titles
  has_many :titles, through: :figure_titles
end
