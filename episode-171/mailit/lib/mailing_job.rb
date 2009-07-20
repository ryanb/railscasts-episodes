class MailingJob < Struct.new(:mailing_id)
  def perform
    mailing = Mailing.find(mailing_id)
    mailing.deliver
  end
end
