class Item < ApplicationRecord
  belongs_to :category
  belongs_to :bland
  belongs_to :exhibitor
  belongs_to :buyer

  mount_uploader :image, ImageUploader
end
