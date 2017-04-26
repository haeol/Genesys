module NavbarHelper
  def search_url
    if curr_page(dashboard_index_path)
      dashboard_index_path
    elsif curr_page(myprofile_index_path)
      myprofile_index_path
    elsif curr_page(friendships_path)
      friendships_path
    elsif curr_page(groups_path)
      groups_path
    elsif curr_page(tags_path)
      tags_path
    else
      dashboard_index_path
    end
  end

  def search_placeholder
    if curr_page(dashboard_index_path)
      "Search dashboard . . ."
    elsif curr_page(myprofile_index_path)
      "Search your profile . . ."
    elsif curr_page(friendships_path)
      "Search for friends . . ."
    elsif curr_page(groups_path)
      "Search for groups . . ."
    elsif curr_page(tags_path)
      "Search for tags . . ."
    else
      "Search dashboard . . ."
    end
  end
end
