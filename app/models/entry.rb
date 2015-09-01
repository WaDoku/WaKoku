class Entry < ActiveRecord::Base
  dragonfly_accessor :image
  validates_presence_of :writing
  validates_presence_of :kana

  validates_size_of :image, maximum: 500.kilobytes,
    message: "Datei überschreitet das Uploadlimit", if: :image_changed?

  validates_property :mime_type, of: :image, in: ["image/jpg", "image/svg+xml", "image/png", "image/jpeg"],
    message: "Format nicht zugelassen", if: :image_changed?

end
