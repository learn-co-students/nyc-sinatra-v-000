class Landmark < ActiveRecord::Base
  belongs_to :figure
  has_many :titles, through: :figure

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    song = self.all.find do |s|
      s.slug == slug
    end
  end
  
end
