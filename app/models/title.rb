class Title < ActiveRecord::Base
  # add relationships here
    has_many :figure_titles
    has_many :figures, through: :figure_titles
    #has_many :landmarks, through: :figures
    #add Collins Park landmark and title President to the Taylor figures collection of landmarks and titles respectively
end
