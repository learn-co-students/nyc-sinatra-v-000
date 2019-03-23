class Title < ActiveRecord::Base
  # add relationships here
  has_many :figure_titles
  has_many :figures, through: :figure_titles

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
    Title.all.find{|title| title.slug == slug}
  end
end
