class Presentation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  def to_s
    self.topic
  end
end
