class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles
  has_many :landmarks, through: :figures
  
  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.find{|figure| figure.name.parameterize == slug}
  end
end
