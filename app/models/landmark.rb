class Landmark < ActiveRecord::Base
  # add relationships here
  belongs_to :figure

  def slug
        self.name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Landmark.all.detect {|landmark| landmark.slug == slug}
    end
end
