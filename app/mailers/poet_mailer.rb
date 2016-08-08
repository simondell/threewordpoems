class PoetMailer < ApplicationMailer
  def account_activation poet
    @poet = poet
    mail to: poet.email, subject: 'Three Word Poems account activation'
  end

  def password_reset poet
    @poet = poet
    mail to: poet.email, subject: 'Three Word Poems password reset'
  end
end
