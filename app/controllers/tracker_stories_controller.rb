class TrackerStoriesController < PrivateController

  def index
    @tracker_stories = TrackerAPI.new.stories(current_user.pivitol_tracker_token)
  end

  def show
  end


end
