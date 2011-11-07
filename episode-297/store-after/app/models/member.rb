class Member < ActiveRecord::Base
  validate :check_membership_number
  
  def check_membership_number
    source = File.read(Rails.root.join("app/assets/javascripts/membership_number.js"))
    context = ExecJS.compile(source)
    unless context.call("isValidMembershipNumber", membership_number)
      errors.add :membership_number, "is an invalid number"
    end
  end
end
