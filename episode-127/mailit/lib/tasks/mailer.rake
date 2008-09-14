desc "Send mailing"
task :send_mailing => :environment do
  mailing = Mailing.find(ENV["MAILING_ID"])
  mailing.deliver
end