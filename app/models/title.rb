class Title < ActiveRecord::Base
  #many-to-many with figures (need join table)
  has_many :figure_titles
  has_many :figures, through: :figure_titles
end
