# frozen_string_literal: true

class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
end
