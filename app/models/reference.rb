class Reference < ActiveRecord::Base
  belongs_to :icon
  belongs_to :entry
  validates_presence_of :name
  validates_presence_of :url

end
