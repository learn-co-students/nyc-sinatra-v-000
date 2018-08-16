class Figure < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
  has_many :figure_titles
  has_many :titles, through: :figure_titles
  has_many :landmarks
end
