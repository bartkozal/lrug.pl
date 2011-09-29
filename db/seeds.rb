event = Event.create(planned_at: Time.zone.now)
user = User.create(first_name: "Johnny", last_name: "Cash")
3.times do
  Presentation.create(topic: "Lorem ipsum dolor sit amet", event: event, user: user)
end
