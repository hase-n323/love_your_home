class BookmarksController < ApplicationController
  before_action :require_login  # ログインしているユーザーのみがアクセス可能にする

  def create
    # 既にブックマークがあるか確認
    bookmark = current_user.bookmarks.find_or_initialize_by(product_number: params[:product_number])
    bookmark.product_link = params[:product_link]
    
    if bookmark.save
      flash[:notice] = "ブックマークしました"
    else
      flash[:alert] = "ブックマークに失敗しました"
    end
    redirect_to simulator_path
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
  
end
  
