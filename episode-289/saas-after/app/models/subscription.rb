class Subscription < ActiveRecord::Base
  belongs_to :plan
  validates_presence_of :plan_id
  validates_presence_of :email
  
  attr_accessor :stripe_card_token, :paypal_payment_token
  
  def save_with_payment
    if valid?
      if paypal_payment_token.present?
        save_with_paypal_payment
      else
        save_with_stripe_payment
      end
    end
  end
  
  def paypal
    PaypalPayment.new(self)
  end
  
  def save_with_paypal_payment
    response = paypal.make_recurring
    self.paypal_recurring_profile_token = response.profile_id
    save!
  end

  def save_with_stripe_payment
    customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
    self.stripe_customer_token = customer.id
    save!
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
  def payment_provided?
    stripe_card_token.present? || paypal_payment_token.present?
  end
end
