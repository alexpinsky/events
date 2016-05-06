task update_saved_state: :environment do
  Event.where(state: 0).update_all(state: Event::STATES.saved)
end