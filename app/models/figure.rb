class Figure <ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  # should move this logic to a module maybe
  def slug ()
    name = self.read_attribute(:name)
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug (slug)
    self.all.find { |genre| genre.slug == slug }
  end
end
