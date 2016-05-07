class Template < ActiveRecord::Base
  belongs_to :category

  has_many :events

  validates :name, uniqueness: true, presence: true

  delegate :name, to: :category, prefix: true

  scope :first_by_name, -> (name) { where('templates.name = ?', name).first }
  scope :simple, -> () { first_by_name :simple }
  scope :paris,  -> () { first_by_name :paris }
  scope :colaze, -> () { first_by_name :colaze }
  scope :c_tree, -> () { first_by_name :c_tree }
end