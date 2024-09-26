class BookmarksController < ApplicationController
  before_action :require_login # ログインしているユーザーのみがアクセス可能にする

  def create
    bookmark = current_user.bookmarks.new(bookmark_params)

    if bookmark.save
      redirect_to rooms_simulator_path, notice: '商品をお気に入りに登録しました。'
    else
      redirect_to rooms_simulator_path, alert: 'お気に入りの登録に失敗しました。'
    end
  end

  def index
    @bookmarks = current_user.bookmarks
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:product_number, :product_link, :product_image)
  end
end
