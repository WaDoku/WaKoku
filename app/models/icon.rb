class Icon < ActiveRecord::Base
  has_many :references
  dragonfly_accessor :icon
  validates_size_of :icon, maximum: 500.kilobytes,
    message: "Datei überschreitet das Uploadlimit", if: :icon_changed?

  validates_property :mime_type, of: :icon, in: ["image/jpg", "image/svg+xml", "image/png", "image/jpeg"],
    message: "Format nicht zugelassen", if: :icon_changed?
end
