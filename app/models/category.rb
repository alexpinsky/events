class Category < ActiveRecord::Base
  has_many :events
  validates :name, uniqueness: true

  scope :by_name, -> (name) { where('categories.name = ?', name) }
  scope :include_themes, -> () do
    includes(:events)
      .where(
        'events.is_theme = ? AND events.state != ?',
        true,
        Event::STATES[:disabled]
      )
      .references(:events)
  end
end