module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :notice then "bg-green-500"
    when :alert  then "bg-red-500"
    when :error  then "bg-yellow-500"
    else "bg-gray-500"
    end
  end

  def page_title(title = '')
    base_title = 'Love your home'
    # title.present? は、title が存在するかどうかをチェックするメソッド
    # present? は、空でない場合に true を返す
    # もし title が存在しなければ、base_title だけが返される
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
