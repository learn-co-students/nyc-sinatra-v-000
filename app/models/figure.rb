class Figure < ActiveRecord::Base
  # add relationships here
  has_many :figure_titles
  has_many :titles, through: :figure_titles
  has_many :landmarks

  def slug
        self.name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Figure.all.detect {|figure| figure.slug == slug}
    end

end
