# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# This will get rid of the field with error setting 
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end