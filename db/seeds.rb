event = Event.create(planned_at: Time.zone.now)
3.times do
  Presentation.create(topic: "Lorem ipsum dolor sit amet", event: event)
end
