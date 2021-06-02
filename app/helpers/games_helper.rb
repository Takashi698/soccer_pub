module GamesHelper
  def new_or_edit_path?
    if action_name == "new"
        games_path
    elsif action_name == "edit"
        game_path
    end
  end
end
