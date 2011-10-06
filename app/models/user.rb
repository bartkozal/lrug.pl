class User < ActiveRecord::Base
  has_many :presentations

  def self.create_with_omniauth(auth)
    create do |user|
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.company = auth["extra"]["user_hash"]["company"]
    end
  end

  def lecture?(presentation)
    presentations.include?(presentation)
  end

  def to_s
    company.present? ? "#{name}, #{company}" : name
  end
end
