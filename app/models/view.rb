class View < ActiveRecord::Base
  belongs_to :event

  validates_presence_of :event_id
  validates_presence_of :ip

  validates_uniqueness_of :ip, scope: :event_id
end