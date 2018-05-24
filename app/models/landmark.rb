class Landmark < ActiveRecord::Base
  belongs_to :figure
end

# rspec spec/models/landmark_spec.rb
