class Figure <ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  def edit_figure(params)
    @figure = Figure.find(params[:id])
    if !!params[:figure]
      @figure.name = params[:figure][:name] if !params[:figure][:name].empty?

      #Associate titles
      if !!params[:figure][:title_ids]
        params[:figure][:title_ids][0].keys.each do |title_id|
          @figure.titles << Title.find(title_id)
        end
      end
      @figure.titles.build(name: params[:title][:name]) if !params[:title][:name].empty?

      #Associate landmarks
      if !!params[:figure][:landmark_ids]
        params[:figure][:landmark_ids][0].keys.each do |landmark_id|
          @figure.landmarks << Landmark.find(landmark_id)
        end
      end
      @figure.landmarks.build(name: params[:landmark][:name]) if !params[:landmark][:name].empty?

      @figure.save
    end
    return @figure
  end
end
