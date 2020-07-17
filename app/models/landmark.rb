class Landmark < ActiveRecord::Base
  #landmark belongs to a figure
  belongs_to :figure

end
