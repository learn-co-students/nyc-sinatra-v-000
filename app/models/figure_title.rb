# this is the join table class
class FigureTitle < ActiveRecord::Base
  belongs_to :figure
  belongs_to :title
end