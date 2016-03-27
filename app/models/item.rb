class Item < ApplicationRecord
  mount_uploader :source, ImageUploader
  belongs_to :destination
end
