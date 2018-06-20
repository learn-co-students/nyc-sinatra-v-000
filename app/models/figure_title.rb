class FigureTitle < ActiveRecord::Base
  belongs_to :figure_id
  belongs_to :title_id
end
