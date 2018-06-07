class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  def self.slug(figure)
    figure.name.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.find_by(name: slug.gsub("-", " "))
  end
end
