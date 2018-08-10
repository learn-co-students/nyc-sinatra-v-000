class Figure <ActiveRecord::Base
has_many :landmarks
has_many :figure_titles
has_many :titles, through: :figure_titles

  def slug
    a = self.name.downcase
    #binding.pry
    if a.gsub!(/[!@% &"]/,'-')
      slug = a
      #binding.pry
    else
      slug = a
    end
    slug
  end

  def self.find_by_slug(slug)
    value = nil
    Figure.all.each do |figure|
      #binding.pry
      if figure.slug == slug
        #binding.pry
        #val = artist
        value = figure
      end
    end
    value
  end

end
