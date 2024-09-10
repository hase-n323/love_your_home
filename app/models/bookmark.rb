class Bookmark < ApplicationRecord
  # これにより、各ブックマークは特定のユーザーに関連付けられるようになる
  belongs_to :user
  # Bookmarkを作成する際に、floor_idが空であってはいけない
  validates :floor_id, presence: true
  # wallpaper_idが空の場合、Bookmarkは無効とされる
  validates :wallpaper_id, presence: true
end
