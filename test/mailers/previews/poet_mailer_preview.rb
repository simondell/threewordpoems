# Preview all emails at http://localhost:3000/rails/mailers/poet_mailer
class PoetMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/poet_mailer/account_activation
  def account_activation
    poet = Poet.first
    poet.activation_token = Poet.new_token
    PoetMailer.account_activation poet
  end

  # Preview this email at http://localhost:3000/rails/mailers/poet_mailer/password_reset
  def password_reset
    poet = Poet.first
    poet.reset_token = Poet.new_token
    PoetMailer.password_reset poet
  end

end
