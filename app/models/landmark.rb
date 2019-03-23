class Landmark < ActiveRecord::Base
  # add relationships here
  belongs_to :figure
  has_many :titles, through: :figure

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
    Landmark.all.find{|landmark| landmark.slug == slug}
  end
end
