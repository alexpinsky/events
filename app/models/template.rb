class Template < ActiveRecord::Base
  belongs_to :category

  has_many :events

  validates :name, uniqueness: true, presence: true

  delegate :name, to: :category, prefix: true
end