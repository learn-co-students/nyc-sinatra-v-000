class Landmark <ActiveRecord::Base
  belongs_to :figure
  has_many :titles, through: :figure
  
  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.find{|landmark| landmark.name.parameterize == slug}
  end
end
