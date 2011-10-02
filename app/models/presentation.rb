class Presentation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  def to_s
    topic
  end
end
