module ApplicationHelper
  def title(page_title)
    ["LRUG", page_title].reject(&:blank?).join(" :: ")
  end
end
