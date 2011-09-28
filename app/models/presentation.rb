class Presentation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validate :topic, presence: true, uniqueness: true

  def to_s
    self.topic
  end
end
