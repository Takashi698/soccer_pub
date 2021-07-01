module TeamsHelper
  def new_or_edit_path?
    if action_name == "new"
        teams_path
    elsif action_name == "edit"
        team_path
    end
  end
end
