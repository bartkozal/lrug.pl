module PresentationsHelper
  def link_to_presentation(presentation)
    topic = presentation.to_s
    return topic if presentation.link.blank?
    link_to topic, presentation.link
  end
end
