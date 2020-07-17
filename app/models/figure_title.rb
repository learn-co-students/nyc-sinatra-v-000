class FigureTitle < ActiveRecord::Base
  #belongs to a figure
  #belongs to a title

  belongs_to :figure
  belongs_to :title

end
