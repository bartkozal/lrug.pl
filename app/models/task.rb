class Task < ActiveRecord::Base
  belongs_to :event
  attr_accessible :body

  def finish
    self.finished = true
    save
  end

  def unfinish
    self.finished = false
    save
  end
end
