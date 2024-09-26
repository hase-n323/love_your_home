class Simulator < ApplicationRecord
  # simulatorモデルがUserモデルに属していることを示し
  # simulatorモデルの各レコードはUserモデルのレコードに関連付けられる
  belongs_to :user
end
