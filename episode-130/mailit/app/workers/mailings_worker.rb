class MailingsWorker < Workling::Base
  def send_mailing(options)
    mailing = Mailing.find(options[:mailing_id])
    mailing.deliver
  end
end