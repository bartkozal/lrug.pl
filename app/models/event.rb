class Event < ActiveRecord::Base
  has_many :presentations
  validates_presence_of :planned_at
  default_scope includes(:presentations).order("planned_at DESC")

  def date
    format_planned_at_with "%e %B %Y"
  end

  def datetime
    format_planned_at_with "%e %B %Y, %H:%M"
  end

  private

  def format_planned_at_with(pattern)
    I18n.localize(planned_at, format: pattern).strip
  end
end
