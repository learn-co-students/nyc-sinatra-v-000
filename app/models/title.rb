class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figure, through: :figure_titles
end
