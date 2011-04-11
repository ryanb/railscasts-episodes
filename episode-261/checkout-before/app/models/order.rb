class Order < ActiveRecord::Base
  attr_accessible :credit_card_number, :credit_card_expires_on
end
