class Category < ActiveRecord::Base
  has_many :templates

  validates :name, uniqueness: true

  NAMES = { wedding: 'wedding' }

  scope :by_name, -> (name) { where('categories.name = ?', name) }
end