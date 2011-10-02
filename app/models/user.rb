class User < ActiveRecord::Base
  has_many :presentations

  def to_s
    [first_name, last_name].join(" ").tap do |personal_details|
      personal_details << ", #{company}" unless company.blank?
    end
  end
end
