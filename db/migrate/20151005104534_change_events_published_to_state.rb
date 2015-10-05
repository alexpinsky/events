class ChangeEventsPublishedToState < ActiveRecord::Migration
  def up
    add_column :events, :state, :integer, default: 0
    Event.where('published = ?', true).update_all(state: Event::STATES[:published])
    remove_column :events, :published
    add_index :events, :state
  end

  def down
    add_column :events, :published, :boolean, default: false
    Event.where('state = ?', Event::STATES[:published]).update_all(published: true)
    remove_column :events, :state
  end
end
