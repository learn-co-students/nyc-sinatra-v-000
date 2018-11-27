class Figure < ActiveRecord::Base
  # add relationships here
  has_many :landmarks
  has_many :titles, through: :figure_title
  has_many :figure_titles
end
