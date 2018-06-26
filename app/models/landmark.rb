class Landmark < ActiveRecord::Base

  require_relative '../models/concerns/slugifiable'

  belongs_to :figure

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end
