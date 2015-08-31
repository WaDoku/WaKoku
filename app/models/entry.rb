class Entry < ActiveRecord::Base
  dragonfly_accessor :image
  validates_presence_of :writing
  validates_presence_of :kana
end
