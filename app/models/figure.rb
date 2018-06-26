class Figure < ActiveRecord::Base

  require_relative '../models/concerns/slugifiable'

  has_many :landmarks
  has_many :figure_titles
  has_many :titles, :through => :figure_titles

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end
