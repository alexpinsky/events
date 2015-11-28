class SocialProvider < ActiveRecord::Base
  belongs_to :user

  TYPES = { facebook: 1 }

  scope :facebook, -> () { where('social_providers.type_enum = ?', TYPES[:facebook]) }
end