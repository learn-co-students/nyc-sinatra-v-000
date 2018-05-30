class Figure < ActiveRecord::Base
  has_many :landmark
  has_many :figure_title
  has_many :titles, through: :figure_title

end
