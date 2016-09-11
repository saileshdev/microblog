module ApplicationHelper

def full_title(title = '')
  base_title = "Microblog"
  if title.empty?
    base_title
  else
    "#{page_title} | #{base_title}"
  end
end

end
