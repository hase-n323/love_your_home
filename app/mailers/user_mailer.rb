class UserMailer < ApplicationMailer
  default from: 'hase.n0400323@gmail.com'

  # reset_password_emailメソッドは引数としてuserオブジェクトを受け取る
  def reset_password_email(user)
    @user = User.find(user.id)
    # このurlでリダイレクトするとパスワードがリセットされる。
    @url  = edit_password_reset_url(@user.reset_password_token)
    # toは宛先、subjectは件名を指定する。
    mail(to: user.email,
         subject: t('defaults.password_reset'))
  end
end
