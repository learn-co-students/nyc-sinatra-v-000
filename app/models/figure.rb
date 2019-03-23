class Figure < ActiveRecord::Base
  # add relationships here
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  def slug
    slug = self.name.downcase
    slug = slug.split
    slug_array
    slug.map! do |word|
      slug_array << word.gsub(/\W/,"")
    end
    slug_array = slug_array.join("-")
    slug = slug_array
    slug
  end

  def self.find_by_slug(slug)
    Figure.all.find{|figure| figure.slug == slug}
  end
end
