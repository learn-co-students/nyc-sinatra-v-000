class FigureTitle < ActiveRecord::Base
  belongs_to :figure
  belongs_to :title


  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find{|s| s.slug == slug}
  end

end #FigureTitle CLASS
