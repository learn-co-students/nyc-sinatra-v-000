class Landmark <ActiveRecord::Base
  belongs_to :figure
  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
