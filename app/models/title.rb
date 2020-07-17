class Title < ActiveRecord::Base
  #title has many figure_titles
  #title has many figures through figure_titles

  has_many :figure_titles
  has_many :figures, :through => :figure_titles

end
