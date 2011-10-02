FactoryGirl.define do
  factory :event do
    planned_at Time.zone.local(2011, 9, 1, 10, 0, 0)
  end

  factory :presentation do
    topic "Lorem ipsum dolor sit amet"
    link "http://www.example.com"
    event
    user
  end

  factory :user do
    first_name "Johnny"
    last_name "Cash"

    factory(:user_with_company) { company "Apple" }
  end
end
