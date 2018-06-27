class Title < ActiveRecord::Base
  has_many :figuretitles
  has_many :figures, through: :figuretitles
  has_many :landmarks, through: :figures
end
