module PagesHelper
  def curr_page(path)
    "current" if current_page?(path)
  end
end
