class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles
end

# A title has_many figure_titles and many figures through figure_titles.