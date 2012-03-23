# encoding: utf-8

class Event < ActiveRecord::Base
  has_many :presentations, :dependent => :nullify
  has_many :tasks
  validates_presence_of :planned_at
  default_scope includes(:presentations).order("planned_at DESC")
  after_save :create_presentations, :create_default_tasks
  attr_accessible :planned_at

  def date
    format_planned_at_with "%e %B %Y"
  end

  def datetime
    format_planned_at_with "%e %B %Y, %H:%M"
  end

  def update_tasks(finished)
    transaction do
      tasks.each do |t|
        finished.include?(t.to_param) ? t.finish : t.unfinish
      end
    end
  end

  private
  def create_presentations
    3.times { presentations.create }
  end

  def create_default_tasks
    [ 'Założyć wątek na forum RoR',
      'Założyć event na Facebook',
      'Tweet',
      'Napisać na grupie dyskusyjnej JUGu'
    ].each { |task| tasks.create(body: task)  }
  end

  def format_planned_at_with(pattern)
    I18n.localize(planned_at, format: pattern).strip
  end
end
