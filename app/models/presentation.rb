class Presentation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  delegate :planned_at, :to => :event
  validates_presence_of :topic, :on => :update

  attr_accessible :topic, :link, :user_id

  def outdated?
    planned_at < Time.zone.now
  end

  def to_s
    topic
  end
end
