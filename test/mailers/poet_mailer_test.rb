require 'test_helper'

class PoetMailerTest < ActionMailer::TestCase
  test "account_activation" do
    poet = poets :test_poet
    poet.activation_token = Poet.new_token
    mail = PoetMailer.account_activation poet
    assert_equal 'Three Word Poems account activation', mail.subject
    assert_equal ['noreply@example.com'], mail.from
    assert_match poet.name, mail.body.encoded
    assert_match poet.activation_token, mail.body.encoded
    assert_match CGI::escape(poet.email), mail.body.encoded
  end
end
