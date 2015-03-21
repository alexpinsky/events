class Category < ActiveRecord::Base
  has_many :events
  validates :name, uniqueness: true

  scope :by_name, -> (name) { where('categories.name = ?', name) } 
  scope :with_themes, -> () { includes(:events).where('events.is_theme = ?', true).references(:events) }
end