class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  
    def self.find_by_slug(slug)
      self.all.find { |name| name.slug == slug}
  end

end
