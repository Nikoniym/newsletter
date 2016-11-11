class Customer < ApplicationRecord
  resourcify

  has_attached_file :avatar, styles: { medium: "300x300", thumb: "120x120" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  crop_attached_file :avatar

  belongs_to :position
end
