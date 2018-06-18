class Figure < ActiveRecord::Base
    has_many :landmarks
    has_many :figure_titles
    has_many :titles, :through => :figure_titles

    extend Paramable::ClassMethods
    include Paramable::InstanceMethods
end 
