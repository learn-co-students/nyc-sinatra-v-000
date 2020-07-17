class Figure < ActiveRecord::Base
  # figures have many figure_titles
  # figures have many landmarks

  has_many :figure_titles
  has_many :titles, :through => :figure_titles
  has_many :landmarks

end
