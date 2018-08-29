class Landmark < ActiveRecord::Base
  belongs_to :figure
end

# A Landmark belongs_to a figure and a figure has_many landmarks.
