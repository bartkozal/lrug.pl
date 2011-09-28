class User < ActiveRecord::Base
  has_many :presentations

  def to_s
    [self.first_name, self.last_name].join(" ")
  end
end
