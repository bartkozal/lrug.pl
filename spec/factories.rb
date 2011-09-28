FactoryGirl.define do
  factory :event do
    planned_at 10.days.from_now
  end

  factory :presentation do
    topic "Lorem ipsum dolor sit amet"
    event
    user
  end

  factory :user do
    first_name "Johnny"
    last_name "Cash"
  end
end
