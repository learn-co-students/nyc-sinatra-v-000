class FigureTitle < ActiveRecord::Base
  belongs_to :figure
  belongs_to :title

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods

  def slug
      Slugify.slug(self.name)
    end

    def self.find_by_slug(slug)
      self.all.find { |name| name.slug == slug}
  end
end
