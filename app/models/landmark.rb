class Landmark < ActiveRecord::Base
  belongs_to :figure

  include Slugifiable
  extend Slugifiable::ClassMethods
end
