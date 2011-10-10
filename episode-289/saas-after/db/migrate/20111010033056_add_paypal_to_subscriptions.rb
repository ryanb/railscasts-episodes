class AddPaypalToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :paypal_customer_token, :string
    add_column :subscriptions, :paypal_recurring_profile_token, :string
  end
end
