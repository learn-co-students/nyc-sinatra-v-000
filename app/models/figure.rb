class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles
end

# A Landmark belongs_to a figure and a figure has_many landmarks.
# A figure has_many figure_titles and many titles through figure_titles.
