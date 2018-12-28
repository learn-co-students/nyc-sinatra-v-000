class Figure < ActiveRecord::Base
  # add relationships here
  has_many :figure_titles
  has_many :titles, through: :figure_titles
  has_many :landmarks

  def replace_titles(new_titles_ids_list)
    self.titles.each do |title|
      self.titles.delete(title)
    end
    new_titles_ids_list.each do |title_id|
      title = Title.find_by_id(title_id)
      self.titles << title
    end
  end

  def replace_landmarks(new_landmarks_ids_list)
    self.landmarks.each do |landmark|
      self.landmarks.delete(landmark)
    end
    new_landmarks_ids_list.each do |landmark_id|
      landmark = Landmark.find_by_id(landmark_id)
      self.landmarks << landmark
    end
  end
end
