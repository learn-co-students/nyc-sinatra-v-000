class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :title, through: :figure_titles
end
