class FigureTitle < ActiveRecord::Base
  belongs_to :figure
  belongs_to :title
end

#belongs_to a figure and a title.
