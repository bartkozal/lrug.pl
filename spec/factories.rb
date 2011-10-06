FactoryGirl.define do
  factory :event do
    planned_at Time.zone.local(2020, 9, 1, 10, 0, 0)
  end

  factory :presentation do
    topic "Lorem ipsum dolor sit amet"
    link "http://www.example.com"
    event
    user
  end

  factory :user do
    uid '12345'
    name "Johnny Cash"
    company "Apple"
  end
end
