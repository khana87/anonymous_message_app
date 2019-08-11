# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/message_card
  def message_card
    user = User.first
    UserMailer.message_card(user)
  end

end
