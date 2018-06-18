class Landmark <ActiveRecord::Base
    belongs_to :figure
    
    extend Paramable::ClassMethods
    include Paramable::InstanceMethods
end
