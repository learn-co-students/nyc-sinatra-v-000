class Landmark < ActiveRecord::Base
  belongs_to :figure

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods

end
