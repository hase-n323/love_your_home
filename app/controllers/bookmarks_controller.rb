class BookmarksController < ApplicationController
  before_action :require_login  # ログインしているユーザーのみがアクセス可能にする
  
  def create
    # 既にブックマークがあるか確認
    bookmark = current_user.bookmarks.find_or_initialize_by(product_number: bookmark_params[:product_number])
    if bookmark.update(bookmark_params)
      flash[:notice] = "ブックマークしました"
    else
      flash[:alert] = "ブックマークに失敗しました"
    end
    redirect_to simulator_path
  end

  # current_user のブックマークを取得し、ビューに渡している
  def index
    @bookmarks = current_user.bookmarks
  end

  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    
    if bookmark&.destroy
      flash[:notice] = "ブックマークを解除しました"
    else
      flash[:alert] = "ブックマークの解除に失敗しました"
    end
    redirect_to simulator_path
  end
  
  private  # クラス内に移動

  def bookmark_params
    params.require(:bookmark).permit(:product_number, :product_link, :product_image_url)
  end
end
