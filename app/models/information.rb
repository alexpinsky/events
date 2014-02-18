class Information < ActiveRecord::Base
  self.table_name = "information"

  belongs_to :event
end
