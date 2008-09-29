#!/usr/bin/env ruby

#You might want to change this
ENV["RAILS_ENV"] ||= "production"

require File.dirname(__FILE__) + "/../../config/environment"

$running = true;
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  mailing = Mailing.next_for_delivery
  if mailing
    mailing.deliver
  else
    sleep 15
  end
end
