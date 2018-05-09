class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles

  def slug
    slug_name = self.name.gsub(' ', '-')
    slug_name = slug_name.gsub(/[^-a-zA-Z0-9$_.+!*()]/, "")
    slug_name = slug_name.downcase
    slug_name
  end

  def self.find_by_slug(slug)
    self.all.find do |feat|
      feat.slug == slug
    end
  end
end
