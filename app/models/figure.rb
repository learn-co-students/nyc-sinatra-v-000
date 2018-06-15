class Figure < ActiveRecord::Base
  has_many :figure_titles
  has_many :titles, through: :figure_titles
  has_many :landmarks

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.find{|figure| figure.name.parameterize == slug}
  end
end
