class Entry < ActiveRecord::Base
  validates_presence_of :writing
  validates_presence_of :kana
end
