class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    song = self.all.find do |s|
      s.slug == slug
    end
  end
  
end
