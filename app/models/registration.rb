class Registration < ActiveRecord::Base
  belongs_to :event
  # enum events: [:ruby_do, :javascript_do]
  #validates_uniqueness_of :email
end
