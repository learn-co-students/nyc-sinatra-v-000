require_relative './concerns/slugify'
class Title < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
  has_many :figure_titles
  has_many :figures, through: :figure_titles
end
