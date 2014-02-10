# Load the rails application.
require File.expand_path('../application', __FILE__)

# Initialize the rails application.
Events::Application.initialize!

ENV['AWS_ACCESS_KEY_ID'] = 'AKIAIQI3X75JJC22IZVQ'
ENV['AWS_SECRET_ACCESS_KEY'] = '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'
ENV['AWS_S3_BUCKET'] = 'events-assets-users'
