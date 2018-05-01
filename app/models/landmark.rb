class Landmark < ActiveRecord::Base

  belongs_to :figure
  
end

# belongs_to a figure and a figure has_many landmarks.
