class Information < ActiveRecord::Base
  self.table_name = "information"

  belongs_to :event

  def self.new_example
    Information.new
  end
end
