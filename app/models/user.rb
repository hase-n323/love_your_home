class User < ApplicationRecord
  authenticates_with_sorcery!

  # ユーザーが複数のsimulatorsレコードを持つことを示しています
  has_many :simulators, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # password；最小で3文字以上必要（新規レコード作成もしくはcrypted_passwordカラムが更新される時のみ適応）
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  # password_confirmation：値が空でないこと・passwordの値と一致すること（新規レコード作成もしくはcrypted_passwordカラムが更新される時のみ適応
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  # email：値が空でないこと・ユニークな値であること
  validates :email, presence: true, uniqueness: true
end
