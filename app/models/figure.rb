class Figure <ActiveRecord::Base
 has_many :landmarks
 has_many :figur_titles
 has_many :titles, through: :figure_titles
end
