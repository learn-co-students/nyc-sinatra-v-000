class Figure <ActiveRecord::Base
  # A figure has_many figure_titles and many titles through figure_titles.
  has_many :figure_titles
  has_many :titles, through: :figure_titles
  has_many :landmarks

end
