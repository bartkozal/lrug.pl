class Presentation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates_presence_of :topic, :on => :update

  def to_s
    topic
  end
end
