class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles
  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
