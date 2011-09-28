class Event < ActiveRecord::Base
  has_many :presentations
  validate :planned_at, presence: true, uniqueness: true
  default_scope includes(:presentations).order("planned_at DESC")

  def date
    format_planned_at_with "%e %B %Y"
  end

  def datetime
    format_planned_at_with "%e %B %Y, %H:%M"
  end

  private

  def format_planned_at_with(pattern)
    I18n.localize(self.planned_at, format: pattern).strip
  end
end
