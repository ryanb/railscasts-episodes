require 'test_helper'

class MailerTest < ActionMailer::TestCase
  tests Mailer
  def test_invitation
    @expected.subject = 'Mailer#invitation'
    @expected.body    = read_fixture('invitation')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_invitation(@expected.date).encoded
  end

end
