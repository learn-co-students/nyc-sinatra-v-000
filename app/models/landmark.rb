require_relative './concerns/slugify'
class Landmark < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
  belongs_to :figure
end
