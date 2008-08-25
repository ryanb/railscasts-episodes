class Mailer < ActionMailer::Base
  def invitation(invitation, signup_url)
    subject    'Invitation'
    recipients invitation.recipient_email
    from       'foo@example.com'
    body       :invitation => invitation, :signup_url => signup_url
    invitation.update_attribute(:sent_at, Time.now)
  end
end
