class BookmarkController < ApplicationController
  # ログインしているユーザーのみがアクセスできるようにする
  before_action :require_login

  # def index
  #   @bookmarks = current_user.bookmarks
  # end

  # def create
  #   # ブックマークを作成する
  #   @bookmark = current_user.bookmarks.new(bookmark_params)
  #   if @bookmark.save
  #     redirect_to bookmarks_path, notice: "ブックマークが保存されました"
  #   else
  #     redirect_back fallback_location: root_path, alert: "ブックマークの保存に失敗しました"
  #   end
  # end

  def create
    bookmark = Bookmark.new(bookmark_params)
    if bookmark.save
      render json: { message: 'Bookmark created successfully' }, status: :created
    else
      render json: { error: 'Failed to create bookmark' }, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @bookmark = current_user.bookmarks.find(params[:id])
  #   @bookmark.destroy
  #   redirect_to bookmarks_path, notice: "ブックマークが削除されました"
  # end

  private

  def bookmark_params
    params.require(:bookmark).permit(:floor_id, :wallpaper_id)
  end
end
