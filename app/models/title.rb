class Title < ActiveRecord::Base
  # add relationships here
  has_many :figure_titles
  has_many :figures, through: :figure_titles

  def slug
        self.name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Title.all.detect {|title| title.slug == slug}
    end
end
